module Locales.Legal.Prelude
    ( LegalLocale(..) 
    , module Lurk.Prelude
    , module Locales.Prelude
     ) where

import Lurk.Prelude
import Locales.Prelude

data LegalLocale = LegalLocale
    { seo :: SEO
    , content :: Html
    }
