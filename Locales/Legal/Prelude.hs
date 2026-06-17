module Locales.Legal.Prelude
    ( LegalLocale(..) 
    , module Lurk.Prelude
    , module Locales.Prelude
     ) where

import Lurk.Prelude
import Locales.Prelude hiding (assetPath)

data LegalLocale = LegalLocale
    { seo :: SEO
    , content :: Html
    }
