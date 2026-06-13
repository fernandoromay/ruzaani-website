module Controller.Static where

import Locales.Home qualified as Home
import Locales.Pricing qualified as Pricing
import Locales.Legal.Terms qualified as Terms
import Locales.Legal.Privacy qualified as Privacy
import Lurk.Prelude
import Network.HTTP.Types (status404)
import Types.Language
import Types.LegalDoc
import View.Error
import View.Home (homeView)
import View.Pricing (pricingView)
import View.Legal
import Web.Scotty (status)

homeAction :: Language -> ActionM ()
homeAction lang = do
    let locale = Home.getLocale lang
    renderView $ homeView lang locale

pricingAction :: Language -> ActionM ()
pricingAction lang = do
    let locale = Pricing.getLocale lang
    renderView $ pricingView lang locale

legalAction :: Language -> LegalDoc -> ActionM ()
legalAction lang doc = do
    let locale = case doc of
            TermsDoc   -> Terms.getLocale lang
            PrivacyDoc -> Privacy.getLocale lang
    renderView $ legalView lang locale

notFoundAction :: ActionM ()
notFoundAction = do
    status status404
    renderView $ error404View EN
