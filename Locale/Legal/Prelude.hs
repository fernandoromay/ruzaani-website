module Locale.Legal.Prelude
    ( LegalLocale(..) 
    , module Lurk.Prelude
    , module Locale.Prelude
     ) where

import Lurk.Prelude
import Locale.Prelude hiding (assetPath)

data LegalLocale = LegalLocale
    { seo :: SEO
    , content :: Html
    }
