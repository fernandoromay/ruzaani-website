module Routes where

import Lurk.Prelude
import Config.Routes
import Types.Language
import Controller.Static
import Network.Wai.Middleware.Static (staticPolicy, addBase)

routes :: ScottyM ()
routes = do
    middleware $ staticPolicy (addBase "public")

    getRoute (path EN Home) $ homeAction EN
    getRoute (path ES Home) $ homeAction ES
    getRoute (path KO Home) $ homeAction KO

    notFound notFoundAction