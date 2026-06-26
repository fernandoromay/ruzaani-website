module Router where

import Lurk.Prelude
import Lurk.App
import Paths
import Controller.Static
import Controller.Form

router :: LurkApp
router = do
    routeSettings [ SecurityHeaders, TrailingSlashes, ForceSSL, ServeStatic "public" ]

    get homePath homeAction
    get productPath productAction
    get agencyPath agencyAction
    get pricingPath pricingAction
    get accessPath accessAction
    get thanksPath thanksAction

    get termsPath (legalAction Terms)
    get privacyPath (legalAction Privacy)

    post enterprisePath enterprisePostAction
    post accessPath accessPostAction

    notFound notFoundAction
