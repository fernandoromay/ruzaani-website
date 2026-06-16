{-# LANGUAGE RecordWildCards #-}

module View.Legal where

import Locales.Legal.Prelude
import View.Layouts.Default (defaultLayout)
import View.Prelude

legalView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> LegalLocale -> Html
legalView lang LegalLocale {..} = defaultLayout lang legalSeo [lurk|
<main class="article-content row justify-content-center py-5">
    <div class="col-md-9 col-lg-8 col-xl-7 col-xxl-6 article-content">
        {content}
    </div>
</main>
|]
  where legalSeo = seo
            { customTags = [lurk|<link rel="stylesheet" href="{assetPath "css/legal.css"}">|]}