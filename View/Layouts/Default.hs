module View.Layouts.Default where

import View.Components (footer, navbar)
import View.Prelude

defaultLayout :: (?currentPath :: Text) => Language -> SEO -> Html -> Html
defaultLayout lang seo viewContent =
  [lurk|
<!DOCTYPE html>
<html lang="{show lang}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{assetPath "img/favicon.png"}">

    {renderSEO seo}

    <link rel="stylesheet" href="{assetPath "css/style.css"}">
</head>
<body style="font-family: sans-serif; margin: 0; padding: 0;">
    {navbar lang}
    
    <main style="padding: 2rem;">
        {viewContent}
    </main>

    {footer lang}
</body>
</html>
|]