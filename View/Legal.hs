{-# LANGUAGE RecordWildCards #-}

module View.Legal where

import View.Prelude
import View.Layout.Default
import Locale.Legal.Prelude

legalView :: ViewCtx Language => LegalLocale -> Html
legalView LegalLocale {..} = defaultLayout seo [lurk|
<main class="article-content row justify-content-center py-5">
    <div class="col-md-9 col-lg-8 col-xl-7 col-xxl-6 article-content">
        {{content}}
    </div>
</main>
|]