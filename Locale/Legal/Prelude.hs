module Locale.Legal.Prelude
    ( LegalLocale(..)
    , module Locale.Prelude
     ) where

import Locale.Prelude hiding (assetPath)

data LegalLocale = LegalLocale
    { seo :: SEO
    , content :: Html
    }
