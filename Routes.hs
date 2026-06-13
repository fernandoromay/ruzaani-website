module Routes where

import Lurk.Prelude
import Config.Routes
import Types.Language
import Controller.Static
import Network.Wai.Middleware.Static (staticPolicy, addBase)

routes :: ScottyM ()
routes = do
    middleware trailingSlash
    middleware $ staticPolicy (addBase "public")

    getRoute (path EN Home) $ homeAction EN
    getRoute (path ES Home) $ homeAction ES
    getRoute (path KO Home) $ homeAction KO

    getRoute (path EN Pricing) $ pricingAction EN
    getRoute (path ES Pricing) $ pricingAction ES
    getRoute (path KO Pricing) $ pricingAction KO

    notFound notFoundAction