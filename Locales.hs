module Locales
    ( module Locales.Home
    , module Locales.Pricing
    , module Locales.Legal
    , module Locales.Common
    , module Locales.Error
    ) where

import Locales.Home hiding (getLocale)
import Locales.Pricing hiding (getLocale)
import Locales.Legal
import Locales.Common
import Locales.Error
