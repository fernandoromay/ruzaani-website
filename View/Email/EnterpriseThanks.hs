{-# LANGUAGE RecordWildCards #-}
module View.Email.EnterpriseThanks where

import Language
import Lurk.Prelude
import Locale.Email.EnterpriseThanks

enterpriseThanks :: (?lang :: Language) => Text -> Html
enterpriseThanks name = [lurk|
<!DOCTYPE html>
<html><head></head>
<body style="font-family: Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
  <div style="border-bottom: 2px solid #000; padding-bottom: 20px; margin-bottom: 30px;">
    <h1>Ruzaani</h1>
  </div>
  <div>
    <p>{{l.greeting}} {{name}},</p>
    <p>{{l.thanks}}</p>
    <p>{{l.review}}</p>
    <p><strong>{{l.nextSteps}}</strong></p>
    <ul><li>{{l.step1}}</li><li>{{l.step2}}</li></ul>
    <p>{{l.signoff1}}<br>{{l.signoff2}}</p>
  </div>
</body></html>
|]
  where l = locale ?lang
