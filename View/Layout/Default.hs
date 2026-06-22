module View.Layout.Default where

import Paths (pageAlts, domain)
import View.Prelude
import View.Partial

defaultLayout :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> SEO -> Html -> Html
defaultLayout lang seo viewContent = [lurk|
<!DOCTYPE html>
<html lang="{{toText lang}}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="color-scheme" content="light dark">
    <link rel="icon" type="image/svg+xml" href="{{assetPath "img/brand/iso_w_inv_round.svg"}}">

    <!-- Styles -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Preconnect -->
    <link rel="preconnect" href="https://cdn.jsdelivr.net">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    {{renderSEO seo}}
    {{renderAlternates domain pageAlts}}

</head>
<body>
    {{navbar lang}}

    {{navside lang}}
    
    {{viewContent}}

    {{footer lang}}

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{assetPath "js/common.js"}}"></script>
</body>
</html>
|]