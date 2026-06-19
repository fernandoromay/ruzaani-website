{-# LANGUAGE RecordWildCards #-}

module View.Email.EnterpriseNotice where

import Lurk.Prelude

data EnterpriseNoticeFields = EnterpriseNoticeFields
    { name         :: Text
    , email        :: Text
    , company      :: Text
    , country      :: Text
    , message      :: Text
    }

enterpriseNotice :: EnterpriseNoticeFields -> Html
enterpriseNotice EnterpriseNoticeFields{..} = [lurk|
<!DOCTYPE html>
<html><head></head>
<body style="font-family: Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
  <div style="border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px;">
    <h1>New Enterprise Inquiry</h1>
  </div>
  <div>
    <p>A new enterprise contact request has been submitted from the pricing page.</p>
    <h3>Contact Details</h3>
    <p><strong>Name:</strong> {{name}}<br>
    <strong>Email:</strong> {{email}}<br>
    <strong>Company:</strong> {{company}}<br>
    <strong>Country:</strong> {{country}}</p>
    <h3>Message</h3>
    <p style="background: #f9f9f9; padding: 15px; border-left: 3px solid #ccc;">
    {{message}}
    </p>
  </div>
</body></html>
|]