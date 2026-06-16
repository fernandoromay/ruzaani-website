module Controller.Static where

import Language
import Lurk.Prelude
import View.Error
import View.Home (homeView)
import View.Legal (legalView)
import View.Agency
import View.Pricing (pricingView)
import Network.HTTP.Types (status404)
import Web.Scotty (status)
import Locales.Home qualified as Home
import Locales.Pricing qualified as Pricing
import Locales.Legal qualified as Legal
import Locales.Agency qualified as Agency

data LegalPage = Terms | Privacy deriving (Eq)

homeAction :: Language -> Action ()
homeAction lang = render $ homeView lang locale
    where locale = Home.getLocale lang

agencyAction :: Language -> Action ()
agencyAction lang = render $ agencyView lang locale
    where locale = Agency.getLocale lang

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
