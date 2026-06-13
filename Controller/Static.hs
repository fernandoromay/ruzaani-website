module Controller.Static where

import Locales.Home qualified as Home
import Locales.Pricing qualified as Pricing
import Lurk.Prelude
import Network.HTTP.Types (status404)
import Types.Language
import View.Error (error404View)
import View.Home (homeView)
import View.Pricing (pricingView)
import Web.Scotty (status)

homeAction :: Language -> ActionM ()
homeAction lang = do
  let locale = Home.getLocale lang
  renderView $ homeView lang locale

pricingAction :: Language -> ActionM ()
pricingAction lang = do
  let locale = Pricing.getLocale lang
  renderView $ pricingView lang locale

notFoundAction :: ActionM ()
notFoundAction = do
  status status404
  renderView $ error404View EN
