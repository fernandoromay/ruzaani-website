module Controller.Static where

import Lurk.Form (setFormLoadTime)
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
import Locale.Home    qualified as Home
import Locale.Product qualified as Product
import Locale.Pricing qualified as Pricing
import Locale.Legal   qualified as Legal
import Locale.Agency  qualified as Agency
import Locale.Access  qualified as Access
import Locale.Thanks  qualified as Thanks

data LegalPage = Terms | Privacy deriving (Eq)

homeAction :: (?lang :: Language) => Action ()
homeAction = render $ homeView (Home.getLocale ?lang)

productAction :: (?lang :: Language) => Action ()
productAction = render $ productView (Product.getLocale ?lang)

agencyAction :: (?lang :: Language) => Action ()
agencyAction = render $ agencyView (Agency.getLocale ?lang)

pricingAction :: (?lang :: Language) => Action ()
pricingAction = do
    country <- cfCountry
    render $ pricingView (Pricing.getLocale ?lang country)

accessAction :: (?lang :: Language) => Action ()
accessAction = do
    setFormLoadTime
    render $ accessView (Access.getLocale ?lang)

thanksAction :: (?lang :: Language) => Action ()
thanksAction = render $ thanksView (Thanks.getLocale ?lang)

legalAction :: (?lang :: Language) => LegalPage -> Action ()
legalAction page = render $ legalView (case page of
    Terms   -> Legal.getLocaleTerms ?lang
    Privacy -> Legal.getLocalePrivacy ?lang)

notFoundAction :: Action ()
notFoundAction = withLang EN $ render error404View
