module Controller.Forms
    ( accessPostAction
    , enterprisePostAction
    , setFormLoadTime
    ) where

import Control.Exception (bracket, try, SomeException)
import Control.Monad (unless)
import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Char (ord)
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.Lazy qualified as TL
import Data.Time.Clock (getCurrentTime, diffUTCTime)
import Data.Time.Format (formatTime, defaultTimeLocale)
import Data.Word (Word8)
import Network.Socket qualified as Socket
import Network.Socket.ByteString qualified as SocketBS
import Network.Wai (requestHeaders)
import System.Directory (createDirectoryIfMissing)
import System.Environment (lookupEnv)
import System.Exit (ExitCode(..))
import System.Process (readProcessWithExitCode)

import Lurk.Session qualified as Session
import Paths (thanksPath)
import View.Prelude
import Web.Scotty (redirect, request)

-- | SMTP configuration
data SmtpConfig = SmtpConfig
    { smtpHost      :: Text
    , smtpPort      :: Int
    , smtpUsername  :: Text
    , smtpPassword  :: Text
    , smtpFrom      :: Text
    , smtpFromName  :: Text
    , smtpAdminEmail :: Text
    }

-- | Load SMTP configuration from environment
loadSmtpConfig :: IO (Maybe SmtpConfig)
loadSmtpConfig = do
    mHost <- lookupEnv "SMTP_RZST_HOST"
    mPort <- lookupEnv "SMTP_RZST_PORT"
    mUser <- lookupEnv "SMTP_RZST_USER"
    mPass <- lookupEnv "SMTP_RZST_PASS"
    mAdmin <- lookupEnv "SMTP_RZST_ADMIN_EMAIL"
    let mFromName = Just "Ruzaani Support Team"
    case (mHost, mPort, mUser, mPass, mAdmin) of
        (Just h, Just p, Just u, Just pw, Just admin) -> do
            let port = case reads p of [(n, "")] -> n; _ -> 587
            pure $ Just SmtpConfig
                { smtpHost      = T.pack h
                , smtpPort      = port
                , smtpUsername  = T.pack u
                , smtpPassword  = T.pack pw
                , smtpFrom      = T.pack u
                , smtpFromName  = maybe "Ruzaani Support Team" T.pack mFromName
                , smtpAdminEmail = T.pack admin
                }
        _ -> pure Nothing

-- | Get client IP from request headers
getClientIp :: Action Text
getClientIp = do
    req <- request
    let headers = requestHeaders req
    pure $ case lookup "X-Forwarded-For" headers of
        Just v -> TE.decodeUtf8 v
        Nothing -> maybe "unknown" TE.decodeUtf8 (lookup "X-Real-IP" headers)

-- | Extract session ID from request
getSid :: Action (Maybe SessionId)
getSid = do getSessionIdFromHeaders <$> request

-- | Read cached form params for current request
readFormParams :: Action [(Text, Text)]
readFormParams = do
    mSid <- getSid
    case mSid of
        Nothing -> pure []
        Just sid -> liftIO $ getCachedFormParams sid

-- | Lookup a single form param
lookupParam :: Text -> [(Text, Text)] -> Text
lookupParam key params = fromMaybe "" (lookup key params)

----------------------------------------------------------------------
-- TIME-TO-SUBMIT
----------------------------------------------------------------------

-- | Store form load time in session
setFormLoadTime :: Action ()
setFormLoadTime = do
    mSid <- getSid
    case mSid of
        Nothing -> pure ()
        Just sid -> do
            store <- liftIO getStore
            now <- liftIO getCurrentTime
            Session.setSessionValue store sid "form_load_time" (T.pack (show now))

-- | Check if at least N seconds have passed since form load
checkTimeToSubmit :: Int -> [(Text, Text)] -> Action Bool
checkTimeToSubmit minSeconds _params = do
    mSid <- getSid
    case mSid of
        Nothing -> pure True
        Just _sid -> do
            store <- liftIO getStore
            sess <- Session.getSession store
            case Session.getSessionValue "form_load_time" sess of
                Nothing -> pure True
                Just loadTimeText ->
                    case reads (T.unpack loadTimeText) of
                        [(loadTime, "")] -> do
                            now <- liftIO getCurrentTime
                            let elapsed = realToFrac (diffUTCTime now loadTime) :: Double
                            pure $ elapsed >= fromIntegral minSeconds
                        _ -> pure True

----------------------------------------------------------------------
-- DNS MX VERIFICATION
----------------------------------------------------------------------

-- | Check if an email domain has valid MX records
checkMxRecord :: Text -> IO Bool
checkMxRecord domain = do
    let domainStr = T.unpack domain
    result <- try $ readProcessWithExitCode "host" ["-t", "MX", domainStr] ""
    case result of
        Left (_ :: SomeException) -> pure True
        Right (ExitSuccess, out, _) ->
            pure $ not (null out)
        Right (ExitFailure _, _, _) -> pure True

-- | Extract domain from email address
emailDomain :: Text -> Text
emailDomain emailAddr = case T.breakOnEnd "@" emailAddr of
    ("", _)    -> ""
    (_, domain) -> domain

----------------------------------------------------------------------
-- LEAD SCORING
----------------------------------------------------------------------

data Qualification = SQL | MQL | NQ deriving (Show, Eq)

qualLabel :: Qualification -> Text
qualLabel SQL = "HIGH PRIORITY"
qualLabel MQL = "QUALIFIED"
qualLabel NQ  = "LOW FIT / EXPLORING"

scoreAccessForm :: [(Text, Text)] -> (Int, Qualification)
scoreAccessForm params = (score, qual)
  where
    verticalScores = Map.fromList
        [ ("aesthetic_wellness", 20)
        , ("dental_medical",     20)
        , ("academy",            20)
        , ("professional",       20)
        , ("agency_type",        30)
        , ("other",               5)
        ]

    channelScores = Map.fromList
        [ ("whatsapp",    20)
        , ("instagram",   20)
        , ("both_social", 20)
        , ("mixed",       15)
        , ("phone_forms", 10)
        ]

    volumeScores = Map.fromList
        [ ("low",        5)
        , ("medium",    15)
        , ("high",      25)
        , ("very_high", 30)
        ]

    painScores = Map.fromList
        [ ("manual_owner", 25)
        , ("manual_staff", 20)
        , ("no_system",    20)
        , ("partial",      10)
        , ("automated",     5)
        ]

    q2 = lookupParam "question-2" params
    q3 = lookupParam "question-3" params
    q4 = lookupParam "question-4" params
    q5 = lookupParam "question-5" params

    score = Map.findWithDefault 0 q2 verticalScores
          + Map.findWithDefault 0 q3 channelScores
          + Map.findWithDefault 0 q4 volumeScores
          + Map.findWithDefault 0 q5 painScores

    qual
        | score >= 65 = SQL
        | score >= 40 = MQL
        | otherwise   = NQ

----------------------------------------------------------------------
-- LOGGING
----------------------------------------------------------------------

ensureLogDir :: IO ()
ensureLogDir = createDirectoryIfMissing True "logs"

appendLog :: FilePath -> Aeson.Value -> IO ()
appendLog path value = do
    ensureLogDir
    let entry = Aeson.encode value <> "\n"
    LBS.appendFile path entry

logAccessSubmission :: [(Text, Text)] -> Qualification -> Int -> Text -> IO ()
logAccessSubmission params qual score ip = do
    now <- getCurrentTime
    let timestamp = T.pack (formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now)
    let entry = Aeson.object
            [ "timestamp" Aeson..= timestamp
            , "qualified" Aeson..= (T.toLower (T.pack (show qual)) :: Text)
            , "score" Aeson..= score
            , "name" Aeson..= lookupParam "name" params
            , "email" Aeson..= lookupParam "email" params
            , "company" Aeson..= lookupParam "company" params
            , "role" Aeson..= lookupParam "role" params
            , "lang" Aeson..= lookupParam "lang" params
            , "ip" Aeson..= ip
            ]
    appendLog "logs/access-submissions.log" entry

logEnterpriseSubmission :: [(Text, Text)] -> Text -> IO ()
logEnterpriseSubmission params ip = do
    now <- getCurrentTime
    let timestamp = T.pack (formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now)
    let entry = Aeson.object
            [ "timestamp" Aeson..= timestamp
            , "name" Aeson..= lookupParam "name" params
            , "email" Aeson..= lookupParam "email" params
            , "company" Aeson..= lookupParam "business" params
            , "lang" Aeson..= lookupParam "lang" params
            , "ip" Aeson..= ip
            ]
    appendLog "logs/enterprise-submissions.log" entry

----------------------------------------------------------------------
-- EMAIL TEMPLATES
----------------------------------------------------------------------

accessNotificationHtml :: [(Text, Text)] -> Qualification -> Int -> Text
accessNotificationHtml params qual score = T.unlines
    [ "<!DOCTYPE html><html><head><style>"
    , "body { font-family: 'Helvetica', Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; }"
    , ".header { border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px; }"
    , ".status-badge { display: inline-block; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 14px; }"
    , ".status-sql { background-color: #d4edda; color: #155724; }"
    , ".status-mql { background-color: #fff3cd; color: #856404; }"
    , ".status-nq { background-color: #f8d7da; color: #721c24; }"
    , "</style></head><body>"
    , "<div class=\"header\"><h1>New Access Request</h1></div>"
    , "<div class=\"content\">"
    , "<p>A new access request has been submitted and qualified.</p>"
    , "<p><strong>Status:</strong> <span class=\"status-badge " <> badgeClass <> "\">" <> qualLabel qual <> "</span></p>"
    , "<p><strong>Score:</strong> " <> T.pack (show score) <> " / 95</p>"
    , "<h3>Contact Details</h3>"
    , "<p><strong>Name:</strong> " <> lookupParam "name" params <> "<br>"
    , "<strong>Email:</strong> " <> lookupParam "email" params <> "<br>"
    , "<strong>Company:</strong> " <> lookupParam "company" params <> "<br>"
    , "<strong>Role:</strong> " <> lookupParam "role" params <> "</p>"
    , "<h3>Profile Data</h3>"
    , "<p><strong>Vertical:</strong> " <> lookupParam "question-2" params <> "<br>"
    , "<strong>Channel:</strong> " <> lookupParam "question-3" params <> "<br>"
    , "<strong>Volume:</strong> " <> lookupParam "question-4" params <> "<br>"
    , "<strong>Handling:</strong> " <> lookupParam "question-5" params <> "</p>"
    , "</div></body></html>"
    ]
  where
    badgeClass = case qual of
        SQL -> "status-sql"
        MQL -> "status-mql"
        NQ  -> "status-nq"

accessConfirmationHtml :: Language -> Text -> Text
accessConfirmationHtml lang name = T.unlines
    [ "<!DOCTYPE html><html><head><style>"
    , "body { font-family: 'Helvetica', Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; }"
    , ".header { border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px; }"
    , "</style></head><body>"
    , "<div class=\"header\"><h1>Ruzaani</h1></div>"
    , "<div class=\"content\">"
    , "<p>" <> greeting <> " " <> name <> ",</p>"
    , "<p>" <> thanks <> "</p>"
    , "<p>" <> review <> "</p>"
    , "<p><strong>" <> nextSteps <> "</strong></p>"
    , "<ul><li>" <> step1 <> "</li><li>" <> step2 <> "</li></ul>"
    , "<p>" <> signoff <> "</p>"
    , "</div></body></html>"
    ]
  where
    (greeting, thanks, review, nextSteps, step1, step2, signoff) = case lang of
        ES -> ( "Hola"
              , "Gracias por solicitar acceso a la plataforma Ruzaani."
              , "Nuestro equipo de soporte está revisando tu perfil para asegurarnos de configurar el entorno adecuado para tu negocio."
              , "Siguientes pasos:"
              , "De ser aprobado, te daremos acceso en menos de 24 horas."
              , "Si necesitamos más información, nos pondremos en contacto contigo directamente."
              , "Saludos cordiales,<br>El equipo de soporte de Ruzaani"
              )
        KO -> ( "안녕하세요"
              , "Ruzaani 플랫폼 액세스를 신청해 주셔서 감사합니다."
              , "귀하의 비즈니스에 맞는 올바른 환경을 설정하기 위해 지원팀에서 프로필을 검토하고 있습니다."
              , "다음 단계:"
              , "승인될 경우 24시간 이내에 액세스 권한이 부여됩니다."
              , "추가 정보가 필요한 경우 직접 연락드리겠습니다."
              , "감사합니다.<br>Ruzaani 지원팀 드림"
              )
        _ -> ( "Hello"
             , "Thank you for requesting access to the Ruzaani platform."
             , "Our support team is reviewing your profile to ensure we set up the right environment for your business."
             , "Next Steps:"
             , "If approved, we will grant you access within 24 hours."
             , "If we need more information, we will contact you directly."
             , "Best regards,<br>The Ruzaani Support Team"
             )

enterpriseNotificationHtml :: [(Text, Text)] -> Text
enterpriseNotificationHtml params = T.unlines
    [ "<!DOCTYPE html><html><head><style>"
    , "body { font-family: 'Helvetica', Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; }"
    , ".header { border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px; }"
    , "</style></head><body>"
    , "<div class=\"header\"><h1>New Enterprise Inquiry</h1></div>"
    , "<div class=\"content\">"
    , "<p>A new enterprise contact request has been submitted from the pricing page.</p>"
    , "<h3>Contact Details</h3>"
    , "<p><strong>Name:</strong> " <> lookupParam "name" params <> "<br>"
    , "<strong>Email:</strong> " <> lookupParam "email" params <> "<br>"
    , "<strong>Company:</strong> " <> lookupParam "business" params <> "<br>"
    , "<strong>Country:</strong> " <> T.toUpper (lookupParam "country" params) <> "</p>"
    , "<h3>Message</h3>"
    , "<p style=\"background: #f9f9f9; padding: 15px; border-left: 3px solid #ccc;\">"
    , lookupParam "message" params
    , "</p></div></body></html>"
    ]

enterpriseConfirmationHtml :: Language -> Text -> Text
enterpriseConfirmationHtml lang name = T.unlines
    [ "<!DOCTYPE html><html><head><style>"
    , "body { font-family: 'Helvetica', Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; }"
    , ".header { border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px; }"
    , "</style></head><body>"
    , "<div class=\"header\"><h1>Ruzaani</h1></div>"
    , "<div class=\"content\">"
    , "<p>" <> greeting <> " " <> name <> ",</p>"
    , "<p>" <> thanks <> "</p>"
    , "<p>" <> review <> "</p>"
    , "<p><strong>" <> nextSteps <> "</strong></p>"
    , "<ul><li>" <> step1 <> "</li><li>" <> step2 <> "</li></ul>"
    , "<p>" <> signoff <> "</p>"
    , "</div></body></html>"
    ]
  where
    (greeting, thanks, review, nextSteps, step1, step2, signoff) = case lang of
        ES -> ( "Hola"
              , "Gracias por ponerte en contacto sobre un acuerdo Enterprise con Ruzaani."
              , "Nuestro equipo de ventas ha recibido tu consulta y está revisando los detalles de tu negocio."
              , "Siguientes pasos:"
              , "Un especialista enterprise te contactará en menos de 24 horas."
              , "Prepararemos una propuesta personalizada basada en tus requerimientos específicos."
              , "Saludos cordiales,<br>El equipo Enterprise de Ruzaani"
              )
        KO -> ( "안녕하세요"
              , "Ruzaani 엔터프라이즈 협약에 관해 문의해 주셔서 감사합니다."
              , "영업팀에서 문의 사항을 접수했으며 귀하의 비즈니스 세부 정보를 검토하고 있습니다."
              , "다음 단계:"
              , "엔터프라이즈 전문가가 24시간 이내에 연락하여 상담 전화를 예약할 것입니다."
              , "귀하의 특정 요구 사항에 맞춘 맞춤형 제안서를 준비하겠습니다."
              , "감사합니다.<br>Ruzaani 엔터프라이즈 팀 드림"
              )
        _ -> ( "Hello"
             , "Thank you for reaching out regarding an Enterprise agreement with Ruzaani."
             , "Our sales team has received your inquiry and is reviewing your business details."
             , "Next Steps:"
             , "An enterprise specialist will contact you within 24 hours to schedule a discovery call."
             , "We will prepare a custom proposal based on your specific requirements."
             , "Best regards,<br>The Ruzaani Enterprise Team"
             )

----------------------------------------------------------------------
-- SMTP EMAIL SENDING
----------------------------------------------------------------------

sendEmail :: SmtpConfig -> Text -> Text -> Text -> IO ()
sendEmail config toAddr subject htmlBody = do
    let host = T.unpack (smtpHost config)
    let port = smtpPort config
    let from = T.unpack (smtpFrom config)
    let user = T.unpack (smtpUsername config)
    let pass = T.unpack (smtpPassword config)
    let to = T.unpack toAddr
    result <- try (smtpSend host port from user pass to toAddr subject htmlBody config)
    case result of
        Left (e :: SomeException) ->
            putStrLn $ "Email send error: " ++ show e
        Right _ ->
            putStrLn $ "Email sent to " ++ to ++ ": " ++ T.unpack subject

smtpSend :: String -> Int -> String -> String -> String -> String -> Text -> Text -> Text -> SmtpConfig -> IO ()
smtpSend host port from user pass to toAddr subject htmlBody config = do
    addrInfo <- Socket.getAddrInfo
        (Just Socket.defaultHints { Socket.addrSocketType = Socket.Stream })
        (Just host)
        (Just (show port))
    case addrInfo of
        [] -> error $ "Could not resolve " ++ host
        (ai:_) -> bracket
            (Socket.openSocket ai)
            Socket.close
            (\sock -> do
                Socket.connect sock (Socket.addrAddress ai)
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock "EHLO localhost\r\n"
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock "AUTH LOGIN\r\n"
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock (TE.encodeUtf8 (T.pack (base64Encode user)) <> "\r\n")
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock (TE.encodeUtf8 (T.pack (base64Encode pass)) <> "\r\n")
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock ("MAIL FROM:<" <> TE.encodeUtf8 (T.pack from) <> ">\r\n")
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock ("RCPT TO:<" <> TE.encodeUtf8 (T.pack to) <> ">\r\n")
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock "DATA\r\n"
                _ <- SocketBS.recv sock 4096
                let emailBody = "From: " <> TE.encodeUtf8 (smtpFromName config <> " <" <> smtpFrom config <> ">")
                             <> "\r\nTo: " <> TE.encodeUtf8 toAddr
                             <> "\r\nSubject: =?UTF-8?B?" <> TE.encodeUtf8 (T.pack (base64Encode (T.unpack subject))) <> "?="
                             <> "\r\nMIME-Version: 1.0"
                             <> "\r\nContent-Type: text/html; charset=UTF-8"
                             <> "\r\nContent-Transfer-Encoding: base64"
                             <> "\r\n\r\n" <> TE.encodeUtf8 (T.pack (base64Encode (T.unpack htmlBody)))
                             <> "\r\n.\r\n"
                SocketBS.sendAll sock emailBody
                _ <- SocketBS.recv sock 4096
                SocketBS.sendAll sock "QUIT\r\n"
                pure ()
            )

-- | Simple Base64 encoding
base64Encode :: String -> String
base64Encode = go
  where
    go [] = []
    go s =
        let (chunk, rest) = splitAt 3 s
            len = length chunk
            padded = chunk ++ replicate (3 - len) '\0'
            b1 = fromIntegral (ord (head padded)) :: Word8
            b2 = fromIntegral (ord (padded !! 1)) :: Word8
            b3 = fromIntegral (ord (padded !! 2)) :: Word8
            encoded = [encodeChar (b1 `div` 4)
                      , encodeChar ((b1 `mod` 4) * 16 + b2 `div` 16)
                      , encodeChar ((b2 `mod` 16) * 4 + b3 `div` 64)
                      , encodeChar (b3 `mod` 64)]
            padding = case len of
                1 -> "=="
                2 -> "="
                _ -> ""
        in take (4 - length padding) encoded ++ padding ++ go rest

    encodeChar n
        | n < 26    = toEnum (fromIntegral n + 65)
        | n < 52    = toEnum (fromIntegral n + 71)
        | n < 62    = toEnum (fromIntegral n - 4)
        | n == 62   = '+'
        | otherwise = '/'

----------------------------------------------------------------------
-- HANDLERS
----------------------------------------------------------------------

accessPostAction :: Language -> Action ()
accessPostAction lang = do
    params <- readFormParams
    ip <- getClientIp

    let honeypot = lookupParam "b_website" params
    unless (T.null honeypot) $ redirect "/404/"

    tooFast <- checkTimeToSubmit 3 params
    unless tooFast $ redirect "/404/"

    let email = lookupParam "email" params
    let domain = emailDomain email
    unless (T.null domain) $ do
        hasMx <- liftIO $ checkMxRecord domain
        unless hasMx $ redirect "/404/"

    let (score, qual) = scoreAccessForm params

    liftIO $ logAccessSubmission params qual score ip

    mConfig <- liftIO loadSmtpConfig
    case mConfig of
        Just config -> liftIO $ do
            let subj = "New Access Request: " <> lookupParam "company" params
                    <> " (" <> qualLabel qual <> " - Score: " <> T.pack (show score) <> ")"
            let body = accessNotificationHtml params qual score
            sendEmail config (smtpAdminEmail config) subj body

            unless (T.null email) $ do
                let confirmSubject = case lang of
                        ES -> "Recibido: Tu solicitud de acceso a Ruzaani"
                        KO -> "수신 완료: Ruzaani 액세스 요청"
                        _  -> "Received: Your Ruzaani Access Request"
                let confirmBody = accessConfirmationHtml lang (lookupParam "name" params)
                sendEmail config email confirmSubject confirmBody
        Nothing ->
            liftIO $ putStrLn "SMTP not configured, skipping email"

    let dest = TL.fromStrict (thanksPath lang)
    redirect dest

enterprisePostAction :: Language -> Action ()
enterprisePostAction lang = do
    params <- readFormParams
    ip <- getClientIp

    let honeypot = lookupParam "b_website" params
    unless (T.null honeypot) $ redirect "/404/"

    tooFast <- checkTimeToSubmit 3 params
    unless tooFast $ redirect "/404/"

    let email = lookupParam "email" params
    let domain = emailDomain email
    unless (T.null domain) $ do
        hasMx <- liftIO $ checkMxRecord domain
        unless hasMx $ redirect "/404/"

    liftIO $ logEnterpriseSubmission params ip

    mConfig <- liftIO loadSmtpConfig
    case mConfig of
        Just config -> liftIO $ do
            let subj = "Enterprise Inquiry: " <> lookupParam "business" params
                    <> " (" <> lookupParam "name" params <> ")"
            let body = enterpriseNotificationHtml params
            sendEmail config (smtpAdminEmail config) subj body

            unless (T.null email) $ do
                let confirmSubject = case lang of
                        ES -> "Recibido: Consulta Enterprise de Ruzaani"
                        KO -> "수신 완료: Ruzaani 엔터프라이즈 문의"
                        _  -> "Received: Your Ruzaani Enterprise Inquiry"
                let confirmBody = enterpriseConfirmationHtml lang (lookupParam "name" params)
                sendEmail config email confirmSubject confirmBody
        Nothing ->
            liftIO $ putStrLn "SMTP not configured, skipping email"

    let dest = TL.fromStrict (thanksPath lang)
    redirect dest
