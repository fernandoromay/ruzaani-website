module Controller.Form
    ( accessPostAction
    , enterprisePostAction
    , setFormLoadTime
    ) where

import Control.Monad (unless)
import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.Lazy qualified as TL
import Data.Time.Clock (getCurrentTime)
import Data.Time.Format (formatTime, defaultTimeLocale)
import Network.Wai (requestHeaders)
import Web.Scotty (redirect, request)
import System.Directory (createDirectoryIfMissing)
import Lurk.Email.SMTP
import Lurk.Form
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

----------------------------------------------------------------------
-- LEAD SCORING
----------------------------------------------------------------------

data Qualification = SQL | MQL | NQ deriving (Show, Eq)

qualLabel :: Qualification -> Text
qualLabel SQL = "HIGH PRIORITY"
qualLabel MQL = "QUALIFIED"
qualLabel NQ  = "LOW FIT / EXPLORING"

scoreAccessForm :: FormData -> (Int, Qualification)
scoreAccessForm fd = (score, qual)
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

    q2 = getParamDef "question-2" "" fd
    q3 = getParamDef "question-3" "" fd
    q4 = getParamDef "question-4" "" fd
    q5 = getParamDef "question-5" "" fd

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

logAccessSubmission :: FormData -> Qualification -> Int -> Text -> IO ()
logAccessSubmission fd qual score ip = do
    now <- getCurrentTime
    let timestamp = T.pack (formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now)
    let entry = Aeson.object
            [ "timestamp" Aeson..= timestamp
            , "qualified" Aeson..= (T.toLower (T.pack (show qual)) :: Text)
            , "score" Aeson..= score
            , "name" Aeson..= getParamDef "name" "" fd
            , "email" Aeson..= getParamDef "email" "" fd
            , "company" Aeson..= getParamDef "company" "" fd
            , "role" Aeson..= getParamDef "role" "" fd
            , "lang" Aeson..= getParamDef "lang" "" fd
            , "ip" Aeson..= ip
            ]
    appendLog "logs/access-submissions.log" entry

logEnterpriseSubmission :: FormData -> Text -> IO ()
logEnterpriseSubmission fd ip = do
    now <- getCurrentTime
    let timestamp = T.pack (formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" now)
    let entry = Aeson.object
            [ "timestamp" Aeson..= timestamp
            , "name" Aeson..= getParamDef "name" "" fd
            , "email" Aeson..= getParamDef "email" "" fd
            , "company" Aeson..= getParamDef "business" "" fd
            , "lang" Aeson..= getParamDef "lang" "" fd
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
    ip <- getClientIp

    withForm
        [ guardHoneypot "b_website" "/404/"
        , guardMinSubmitTime 3 "/404/"
        , guardMxRecord "email" "/404/"
        ]
        (\_ -> redirect "/404/")
        $ \fd -> do
            let email = getParamDef "email" "" fd
            let (score, qual) = scoreAccessForm fd

            liftIO $ logAccessSubmission fd qual score ip

            mConfig <- liftIO loadSmtpConfig
            mAdmin <- liftIO loadAdminEmail
            case (mConfig, mAdmin) of
                (Just config, Just adminEmail) -> liftIO $ do
                    let subj = "New Access Request: " <> getParamDef "company" "" fd
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
                            , name = getParamDef "name" "" fd
                            , email = getParamDef "email" "" fd
                            , company = getParamDef "company" "" fd
                            , role = getParamDef "role" "" fd
                            , country = T.toTitle (getParamDef "country" "" fd)
                            , langText = toName (fromText EN (getParamDef "lang" "" fd))
                            , useCase = getParamDef "question-1" "" fd
                            , vertical = getParamDef "question-2" "" fd
                            , channel = getParamDef "question-3" "" fd
                            , volume = getParamDef "question-4" "" fd
                            , handling = getParamDef "question-5" "" fd
                            , ip = ip
                            }
                        body = renderHtml (accessNotice dataFields)
                    sendAndLog config adminEmail subj body

                    unless (T.null email) $ do
                        let l = AL.getLocale lang
                            thanksFields = AccessThanksFields
                                { name = getParamDef "name" "" fd
                                , greeting = AL.greeting l
                                , thanks = AL.thanks l
                                , review = AL.review l
                                , nextSteps = AL.nextSteps l
                                , step1 = AL.step1 l
                                , step2 = AL.step2 l
                                , signoff1 = AL.signoff1 l
                                , signoff2 = AL.signoff2 l
                                }
                            confirmSubject = AL.subject l
                            confirmBody = renderHtml (accessThanks thanksFields)
                        sendAndLog config email confirmSubject confirmBody
                _ ->
                    liftIO $ smtpLog "SMTP not configured, skipping email"

            let dest = TL.fromStrict (thanksPath lang)
            redirect dest

enterprisePostAction :: Language -> Action ()
enterprisePostAction lang = do
    ip <- getClientIp

    withForm
        [ guardHoneypot "b_website" "/404/"
        , guardMinSubmitTime 3 "/404/"
        , guardMxRecord "email" "/404/"
        ]
        (\_ -> redirect "/404/")
        $ \fd -> do
            let email = getParamDef "email" "" fd

            liftIO $ logEnterpriseSubmission fd ip

            mConfig <- liftIO loadSmtpConfig
            mAdmin <- liftIO loadAdminEmail
            case (mConfig, mAdmin) of
                (Just config, Just adminEmail) -> liftIO $ do
                    let subj = "Enterprise Inquiry: " <> getParamDef "business" "" fd
                            <> " (" <> getParamDef "name" "" fd <> ")"
                    let
                        dataFields = EnterpriseNoticeFields
                            { name = getParamDef "name" "" fd
                            , email = getParamDef "email" "" fd
                            , company = getParamDef "business" "" fd
                            , country = T.toUpper (getParamDef "country" "" fd)
                            , message = getParamDef "message" "" fd
                            }
                        body = renderHtml (enterpriseNotice dataFields)
                    sendAndLog config adminEmail subj body

                    unless (T.null email) $ do
                        let l = EL.getLocale lang
                            thanksFields = EnterpriseThanksFields
                                { name = getParamDef "name" "" fd
                                , greeting = EL.greeting l
                                , thanks = EL.thanks l
                                , review = EL.review l
                                , nextSteps = EL.nextSteps l
                                , step1 = EL.step1 l
                                , step2 = EL.step2 l
                                , signoff1 = EL.signoff1 l
                                , signoff2 = EL.signoff2 l
                                }
                            confirmSubject = EL.subject l
                            confirmBody = renderHtml (enterpriseThanks thanksFields)
                        sendAndLog config email confirmSubject confirmBody
                _ ->
                    liftIO $ smtpLog "SMTP not configured, skipping enterprise email"

            let dest = TL.fromStrict (thanksPath lang)
            redirect dest
