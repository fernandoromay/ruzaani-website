module Controller.Static where

import Network.HTTP.Types (status404)
import Web.Scotty (status)
import Language
import View.Prelude
import View.Error
import View.Home
import View.Product
import View.Agency
import View.Pricing
import View.Access
import View.Thanks
import View.Legal
import Locales.Home qualified as Home
import Locales.Product qualified as Product
import Locales.Pricing qualified as Pricing
import Locales.Legal qualified as Legal
import Locales.Agency qualified as Agency
import Locales.Access qualified as Access
import Locales.Thanks qualified as Thanks
import Controller.Form (setFormLoadTime)

data LegalPage = Terms | Privacy deriving (Eq)

homeAction :: Language -> Action ()
homeAction lang = render $ homeView lang locale
    where locale = Home.getLocale lang

productAction :: Language -> Action ()
productAction lang = render $ productView lang locale
    where locale = Product.getLocale lang

agencyAction :: Language -> Action ()
agencyAction lang = render $ agencyView lang locale
    where locale = Agency.getLocale lang

pricingAction :: Language -> Action ()
pricingAction lang = do
    country <- cfCountry
    render $ pricingView lang (Pricing.getLocale lang country)

accessAction :: Language -> Action ()
accessAction lang = do
    setFormLoadTime
    render $ accessView lang locale
    where locale = Access.getLocale lang

thanksAction :: Language -> Action ()
thanksAction lang = render $ thanksView lang locale
    where locale = Thanks.getLocale lang

legalAction :: Language -> LegalPage -> Action ()
legalAction lang page = render $ legalView lang locale
    where locale = case page of
            Terms   -> Legal.getLocaleTerms lang
            Privacy -> Legal.getLocalePrivacy lang

notFoundAction :: Action ()
notFoundAction = do
    status status404
    render (error404View EN)
