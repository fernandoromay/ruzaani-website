{-# LANGUAGE RecordWildCards #-}

module View.Thanks where

import Locales.Thanks
import View.Layouts.Default
import View.Prelude

thanksView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> ThanksLocale -> Html
thanksView lang ThanksLocale{..} = defaultLayout lang seo [lurk|
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
|]