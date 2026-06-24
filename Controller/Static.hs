module Controller.Static where

import Lurk.Form (setFormLoadTime)
import Lurk.Cloudflare (cfCountry)
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
homeAction = render $ homeView (Home.locale ?lang)

productAction :: (?lang :: Language) => Action ()
productAction = render $ productView (Product.locale ?lang)

agencyAction :: (?lang :: Language) => Action ()
agencyAction = render $ agencyView (Agency.locale ?lang)

pricingAction :: (?lang :: Language) => Action ()
pricingAction = do
    country <- cfCountry
    render $ pricingView (Pricing.locale ?lang country)

accessAction :: (?lang :: Language) => Action ()
accessAction = do
    setFormLoadTime
    render $ accessView (Access.locale ?lang)

thanksAction :: (?lang :: Language) => Action ()
thanksAction = render $ thanksView (Thanks.locale ?lang)

legalAction :: (?lang :: Language) => LegalPage -> Action ()
legalAction page = render $ legalView (case page of
    Terms   -> Legal.localeTerms ?lang
    Privacy -> Legal.localePrivacy ?lang)

notFoundAction :: Action ()
notFoundAction = withLang EN $ render error404View
