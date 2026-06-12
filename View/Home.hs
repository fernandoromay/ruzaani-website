{-# LANGUAGE RecordWildCards #-}
module View.Home where

import View.Prelude
import Locales.Home (HomeLocale(..))
import View.Layouts.Default (defaultLayout)

homeView :: (?currentPath :: Text) => Language -> HomeLocale -> Html
homeView lang HomeLocale{..} = defaultLayout lang homeSeo [lurk|
    <div class="home-container">
        <h2>{title}</h2>
        <p>{message}</p>
    </div>
|]
  where
    homeSeo = seo
      { customTags = [lurk|
          <link rel="stylesheet" href="{assetPath "css/home.css"}">
          <link rel="stylesheet" href="{assetPath "css/home-animations.css"}">
          <link rel="stylesheet" href="{assetPath "css/mockups.css"}">
      |]
      }
