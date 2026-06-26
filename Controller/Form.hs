module Controller.Form
    ( accessPostAction
    , enterprisePostAction
    , setFormLoadTime
    ) where

import Control.Monad (unless)
import Data.Aeson qualified as Aeson
import Data.Map.Strict qualified as Map
import Data.Maybe (fromMaybe)
import Data.Text qualified as T
import Lurk.Prelude
import Lurk.Email.SMTP
import Lurk.Form
import Lurk.Log (Logger(..), newLogger)
import Paths (thanksPath)
import Language
import View.Email.AccessNotice
import View.Email.EnterpriseNotice
import View.Email.AccessThanks
import View.Email.EnterpriseThanks
import Locale.Email.AccessThanks qualified as AL
import Locale.Email.EnterpriseThanks qualified as EL

-- | Load SMTP configuration from environment
loadSmtpConfig :: IO (Maybe SmtpConfig)
loadSmtpConfig = do
    mHost <- getEnv "SMTP_HOST"
    mPort <- getEnvInt "SMTP_PORT"
    mUser <- getEnv "SMTP_USER"
    mPass <- getEnv "SMTP_PASS"
    mEncr <- getEnvWithDefault "SMTP_ENCR" ""
    case (mHost, mPort, mUser, mPass) of
        (Just h, Just p, Just u, Just pw) -> do
            pure $ Just SmtpConfig
                { smtpHost       = h
                , smtpPort       = p
                , smtpUsername   = u
                , smtpPassword   = pw
                , smtpFrom       = u
                , smtpFromName   = "Ruzaani Support Team"
                , smtpEncryption = mEncr
                }
        _ -> pure Nothing

-- | Load admin email from environment
loadAdminEmail :: IO (Maybe Text)
loadAdminEmail = getEnv "ADMIN_EMAIL"

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
        [ ("whatsapp",    15)
        , ("social_media",   15)
        , ("mixed",       20)
        , ("phone_webforms", 10)
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
        | score >= 70 = SQL
        | score >= 40 = MQL
        | otherwise   = NQ

----------------------------------------------------------------------
-- LOGGING
----------------------------------------------------------------------

logAccessSubmission :: Logger -> FormData -> Qualification -> Int -> Text -> IO ()
logAccessSubmission logger fd qual score ip =
    logInfo logger "Access form submitted"
        [ ("qualified", Aeson.String (T.toLower (T.pack (show qual))))
        , ("score", Aeson.Number (fromIntegral score))
        , ("name", Aeson.String (getParamDef "name" "" fd))
        , ("email", Aeson.String (getParamDef "email" "" fd))
        , ("company", Aeson.String (getParamDef "company" "" fd))
        , ("role", Aeson.String (getParamDef "role" "" fd))
        , ("lang", Aeson.String (getParamDef "lang" "" fd))
        , ("ip", Aeson.String ip)
        ]

logEnterpriseSubmission :: Logger -> FormData -> Text -> IO ()
logEnterpriseSubmission logger fd ip =
    logInfo logger "Enterprise inquiry submitted"
        [ ("name", Aeson.String (getParamDef "name" "" fd))
        , ("email", Aeson.String (getParamDef "email" "" fd))
        , ("company", Aeson.String (getParamDef "business" "" fd))
        , ("lang", Aeson.String (getParamDef "lang" "" fd))
        , ("ip", Aeson.String ip)
        ]

----------------------------------------------------------------------
-- SMTP EMAIL SENDING
----------------------------------------------------------------------

sendAndLog :: Logger -> SmtpConfig -> Text -> Text -> Text -> IO ()
sendAndLog logger config toAddr subject htmlBody = do
    logInfo logger ("SMTP sending to " <> toAddr) []
    result <- sendEmail config (Email toAddr subject htmlBody)
    case result of
        Left err -> logError logger ("SMTP failed to " <> toAddr)
            [ ("error", Aeson.String (T.pack (show err))) ]
        Right _  -> logInfo logger ("SMTP sent to " <> toAddr)
            [ ("subject", Aeson.String subject) ]

----------------------------------------------------------------------
-- HANDLERS
----------------------------------------------------------------------

accessPostAction :: (?lang :: Language) => Action ()
accessPostAction = do
    ip <- fromMaybe "unknown" <$> clientIp

    fd <- validateForm
        (map ($ redirect "/404/")
            [ honeypot "b_website"
            , minSubmitTime 3
            , mxRecord "email"
            ]
        )

    let email = getParamDef "email" "" fd
    let (score, qual) = scoreAccessForm fd

    smtpLogger <- liftIO $ newLogger "logs/smtp.log"
    accessLogger <- liftIO $ newLogger "logs/access-submissions.log"

    liftIO $ logAccessSubmission accessLogger fd qual score ip

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
            sendAndLog smtpLogger config adminEmail subj body

            unless (T.null email) $ do
                let l = AL.locale ?lang
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
                sendAndLog smtpLogger config email confirmSubject confirmBody
        _ -> liftIO $ do
            logWarning smtpLogger "SMTP not configured, skipping email" []

    redirect (thanksPath ?lang)

enterprisePostAction :: (?lang :: Language) => Action ()
enterprisePostAction = do
    ip <- fromMaybe "unknown" <$> clientIp

    fd <- validateForm
        (map ($ redirect "/404/")
            [ honeypot "b_website"
            , minSubmitTime 3
            , mxRecord "email"
            ]
        )

    let email = getParamDef "email" "" fd

    smtpLogger <- liftIO $ newLogger "logs/smtp.log"
    enterpriseLogger <- liftIO $ newLogger "logs/enterprise-submissions.log"

    liftIO $ logEnterpriseSubmission enterpriseLogger fd ip

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
            sendAndLog smtpLogger config adminEmail subj body

            unless (T.null email) $ do
                let l = EL.locale ?lang
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
                sendAndLog smtpLogger config email confirmSubject confirmBody
        _ -> liftIO $ do
            logWarning smtpLogger "SMTP not configured, skipping enterprise email" []

    redirect (thanksPath ?lang)
