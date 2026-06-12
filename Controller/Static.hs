module Controller.Static where

import Locales.Home qualified as Home
import Lurk.Prelude
import Network.HTTP.Types (status404)
import Types.Language
import View.Error (error404View)
import View.Home (homeView)
import Web.Scotty (status)

homeAction :: Language -> ActionM ()
homeAction lang = do
  let locale = Home.getLocale lang
  renderView $ homeView lang locale

notFoundAction :: ActionM ()
notFoundAction = do
  status status404
  renderView $ error404View EN
