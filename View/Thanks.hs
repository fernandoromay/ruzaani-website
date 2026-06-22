{-# LANGUAGE RecordWildCards #-}

module View.Thanks where

import View.Prelude
import View.Partial
import Locale.Thanks

thanksView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> ThanksLocale -> Html
thanksView lang ThanksLocale{..} = [lurk|
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
</head>
<body>
    {{navbar lang}}

    {{navside lang}}

    <main class="flex-grow-1 d-flex align-items-center justify-content-center min-vh-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <div class="mb-5 fade-in-up">
                        <i class="bi bi-check-circle-fill text-accent" style="font-size: 6rem;"></i>
                    </div>
                    <h1 class="display-4 mb-4 fade-in-up" style="animation-delay: 100ms;">
                        {{header}}
                    </h1>
                    <p class="lead text-secondary mb-5 fade-in-up" style="animation-delay: 200ms;">
                        <strong class="text-main">{{subheader}}</strong><br><br>
                        {{description}}
                    </p>
                    <div class="fade-in-up" style="animation-delay: 300ms;">
                        <a href="{{goBackLink}}" class="btn-primary btn-lg">
                            {{goBackText}}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    {{footer lang}}

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{assetPath "js/common.js"}}"></script>
</body>
</html>
|]