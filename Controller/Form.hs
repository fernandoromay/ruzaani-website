module Controller.Form
    ( accessPostAction
    , enterprisePostAction
    , setFormLoadTime
    ) where

import Control.Monad (unless)
import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.Lazy qualified as TL
import Data.Time.Clock (getCurrentTime, diffUTCTime)
import Data.Time.Format (formatTime, defaultTimeLocale)
import Network.Wai (requestHeaders)
import Web.Scotty (redirect, request)
import System.Directory (createDirectoryIfMissing)
import System.Exit (ExitCode(..))
import System.Process (readProcessWithExitCode)
import System.Timeout (timeout)
import Control.Exception (try, SomeException)
import Lurk.Session qualified as Session
import Lurk.Email.SMTP
import Paths (thanksPath)
import View.Prelude
import View.Email.AccessNotice
import View.Email.EnterpriseNotice
import Locale.Email.AccessThanks qualified as AL
import Locale.Email.EnterpriseThanks qualified as EL
import View.Email.AccessThanks
import View.Email.EnterpriseThanks

-- | Load SMTP configuration from environment
loadSmtpConfig :: IO (Maybe SmtpConfig)
loadSmtpConfig = do
    env <- getAppEnv
    let mHost = getEnv env "SMTP_RZST_HOST"
        mPort = getEnv env "SMTP_RZST_PORT"
        mUser = getEnv env "SMTP_RZST_USER"
        mPass = getEnv env "SMTP_RZST_PASS"
    case (mHost, mPort, mUser, mPass) of
        (Just h, Just p, Just u, Just pw) -> do
            let port = case reads (T.unpack p) of [(n, "")] -> n; _ -> 587
            pure $ Just SmtpConfig
                { smtpHost     = h
                , smtpPort     = port
                , smtpUsername = u
                , smtpPassword = pw
                , smtpFrom     = u
                , smtpFromName = "Ruzaani Support Team"
                }
        _ -> pure Nothing

-- | Load admin email from environment
loadAdminEmail :: IO (Maybe Text)
loadAdminEmail = do
    env <- getAppEnv
    pure $ getEnv env "SMTP_RZST_ADMIN_EMAIL"

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

-- | Check if an email domain has valid MX records (2-second timeout)
checkMxRecord :: Text -> IO Bool
checkMxRecord domain = do
    let domainStr = T.unpack domain
    result <- timeout 2000000 $ try $ readProcessWithExitCode "host" ["-t", "MX", domainStr] ""
    case result of
        Nothing -> pure True  -- timeout, allow submission
        Just (Left (_ :: SomeException)) -> pure True
        Just (Right (ExitSuccess, out, _)) ->
            pure $ not (null out)
        Just (Right (ExitFailure _, _, _)) -> pure True

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
-- SMTP EMAIL SENDING
----------------------------------------------------------------------

smtpLog :: String -> IO ()
smtpLog msg = do
    ensureLogDir
    now <- getCurrentTime
    let ts = formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now
    appendFile "logs/smtp.log" $ "[" ++ ts ++ "] " ++ msg ++ "\n"

sendAndLog :: SmtpConfig -> Text -> Text -> Text -> IO ()
sendAndLog config toAddr subject htmlBody = do
    let to = T.unpack toAddr
    smtpLog $ "SMTP sending to " ++ to
    result <- sendEmail config (Email toAddr subject htmlBody)
    case result of
        Left err -> smtpLog $ "SMTP ERROR to " ++ to ++ ": " ++ show err
        Right _  -> smtpLog $ "SMTP OK to " ++ to ++ ": " ++ T.unpack subject

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
    mAdmin <- liftIO loadAdminEmail
    case (mConfig, mAdmin) of
        (Just config, Just adminEmail) -> liftIO $ do
            let subj = "New Access Request: " <> lookupParam "company" params
                    <> " (" <> qualLabel qual <> " - Score: " <> T.pack (show score) <> ")"
            let 
                dataFields = AccessNoticeFields
                    { badgeStyle = case qual of
                        SQL -> "background-color: #d4edda; color: #155724;"
                        MQL -> "background-color: #fff3cd; color: #856404;"
                        NQ  -> "background-color: #f8d7da; color: #721c24;"
                    , qualText = qualLabel qual
                    , scoreText = T.pack (show score)
                    , maxScoreText = T.pack (show (105 :: Int))
                    , name = lookupParam "name" params
                    , email = lookupParam "email" params
                    , company = lookupParam "company" params
                    , role = lookupParam "role" params
                    , country = T.toTitle (lookupParam "country" params)
                    , langText = toName (fromText EN (lookupParam "lang" params))
                    , useCase = lookupParam "question-1" params
                    , vertical = lookupParam "question-2" params
                    , channel = lookupParam "question-3" params
                    , volume = lookupParam "question-4" params
                    , handling = lookupParam "question-5" params
                    , ip = ip
                    }
                body = renderHtml (accessNotice dataFields)
            sendAndLog config adminEmail subj body

            unless (T.null email) $ do
                let confirmLocale = AL.getLocale lang
                    thanksFields = AccessThanksFields
                        { name = lookupParam "name" params
                        , greeting = AL.greeting confirmLocale
                        , thanks = AL.thanks confirmLocale
                        , review = AL.review confirmLocale
                        , nextSteps = AL.nextSteps confirmLocale
                        , step1 = AL.step1 confirmLocale
                        , step2 = AL.step2 confirmLocale
                        , signoff1 = AL.signoff1 confirmLocale
                        , signoff2 = AL.signoff2 confirmLocale
                        }
                    confirmSubject = AL.subject confirmLocale
                    confirmBody = renderHtml (accessThanks thanksFields)
                sendAndLog config email confirmSubject confirmBody
        _ ->
            liftIO $ smtpLog "SMTP not configured, skipping email"

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
    mAdmin <- liftIO loadAdminEmail
    case (mConfig, mAdmin) of
        (Just config, Just adminEmail) -> liftIO $ do
            let subj = "Enterprise Inquiry: " <> lookupParam "business" params
                    <> " (" <> lookupParam "name" params <> ")"
            let 
                dataFields = EnterpriseNoticeFields
                    { name = lookupParam "name" params
                    , email = lookupParam "email" params
                    , company = lookupParam "business" params
                    , country = T.toUpper (lookupParam "country" params)
                    , message = lookupParam "message" params
                    }
                body = renderHtml (enterpriseNotice dataFields)
            sendAndLog config adminEmail subj body

            unless (T.null email) $ do
                let confirmLocale = EL.getLocale lang
                    thanksFields = EnterpriseThanksFields
                        { name = lookupParam "name" params
                        , greeting = EL.greeting confirmLocale
                        , thanks = EL.thanks confirmLocale
                        , review = EL.review confirmLocale
                        , nextSteps = EL.nextSteps confirmLocale
                        , step1 = EL.step1 confirmLocale
                        , step2 = EL.step2 confirmLocale
                        , signoff1 = EL.signoff1 confirmLocale
                        , signoff2 = EL.signoff2 confirmLocale
                        }
                    confirmSubject = EL.subject confirmLocale
                    confirmBody = renderHtml (enterpriseThanks thanksFields)
                sendAndLog config email confirmSubject confirmBody
        _ ->
            liftIO $ smtpLog "SMTP not configured, skipping enterprise email"

    let dest = TL.fromStrict (thanksPath lang)
    redirect dest
