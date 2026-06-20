{-# LANGUAGE RecordWildCards #-}
module View.Email.EnterpriseThanks where

import Lurk.Prelude

data EnterpriseThanksFields = EnterpriseThanksFields
    { name      :: Text
    , greeting  :: Text
    , thanks    :: Text
    , review    :: Text
    , nextSteps :: Text
    , step1     :: Text
    , step2     :: Text
    , signoff1  :: Text
    , signoff2  :: Text
    }

enterpriseThanks :: EnterpriseThanksFields -> Html
enterpriseThanks EnterpriseThanksFields{..} = [lurk|
<!DOCTYPE html>
<html><head></head>
<body style="font-family: Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
  <div style="border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px;">
    <h1>Ruzaani</h1>
  </div>
  <div>
    <p>{{greeting}} {{name}},</p>
    <p>{{thanks}}</p>
    <p>{{review}}</p>
    <p><strong>{{nextSteps}}</strong></p>
    <ul><li>{{step1}}</li><li>{{step2}}</li></ul>
    <p>{{signoff1}}<br>{{signoff2}}</p>
  </div>
</body></html>
|]
