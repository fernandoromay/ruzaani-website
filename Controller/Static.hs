module Controller.Static where

import Language
import Lurk.Prelude
import View.Error
import View.Home (homeView)
import View.Legal (legalView)
import View.Pricing (pricingView)
import Network.HTTP.Types (status404)
import Web.Scotty (status)
import qualified Locales.Home as Home
import qualified Locales.Pricing as Pricing
import qualified Locales.Legal as Legal

data LegalPage = Terms | Privacy deriving (Eq)

homeAction :: Language -> Action ()
homeAction lang = render $ homeView lang locale
    where locale = Home.getLocale lang

pricingAction :: Language -> Action ()
pricingAction lang = do
    country <- cfCountry
    render $ pricingView lang (Pricing.getLocale lang country)

legalAction :: Language -> LegalPage -> Action ()
legalAction lang page = render $ legalView lang locale
    where locale = case page of
            Terms   -> Legal.getLocaleTerms lang
            Privacy -> Legal.getLocalePrivacy lang

notFoundAction :: Action ()
notFoundAction = do
    status status404
    render (error404View EN)
