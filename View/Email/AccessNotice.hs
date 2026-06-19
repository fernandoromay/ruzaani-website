{-# LANGUAGE RecordWildCards #-}

module View.Email.AccessNotice where

import Lurk.Prelude

data AccessNoticeFields = AccessNoticeFields
    { badgeStyle   :: Text
    , qualText     :: Text
    , scoreText    :: Text
    , maxScoreText :: Text
    , name         :: Text
    , email        :: Text
    , company      :: Text
    , role         :: Text
    , country      :: Text
    , langText     :: Text
    , useCase      :: Text
    , vertical     :: Text
    , channel      :: Text
    , volume       :: Text
    , handling     :: Text
    , ip           :: Text
    }

accessNotice :: AccessNoticeFields -> Html
accessNotice AccessNoticeFields{..} = [lurk|
<!DOCTYPE html>
<html>
<head></head>
<body style="font-family: Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
    <div style="border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px;">
        <h1>New Access Request</h1>
    </div>
    <div>
        <p>A new access request has been submitted and qualified.</p>
        <p><strong>Status:</strong> <span style="display: inline-block; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 14px; {{badgeStyle}}">{{qualText}}</span></p>
        <p><strong>Score:</strong> {{scoreText}} / {{maxScoreText}}</p>
        <h3>Contact Details</h3>
        <p><strong>Name:</strong> {{name}}<br>
        <strong>Email:</strong> {{email}}<br>
        <strong>Company:</strong> {{company}}<br>
        <strong>Role:</strong> {{role}}<br>
        <strong>Country:</strong> {{country}}<br>
        <strong>Language:</strong> {{langText}}</p>
        <h3>Profile Data</h3>
        <p><strong>Use Case:</strong> {{useCase}}<br>
        <strong>Vertical:</strong> {{vertical}}<br>
        <strong>Channel:</strong> {{channel}}<br>
        <strong>Volume:</strong> {{volume}}<br>
        <strong>Handling:</strong> {{handling}}</p>
        <p style="margin-top: 30px; font-size: 12px; color: #999;">
            Submitted via Ruzaani Onboarding Flow.
            <br>
            IP: {{ip}}
        </p>
    </div>
</body>
</html>
|]
