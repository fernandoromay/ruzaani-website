module Router where

import Language (allLanguages) --, Language(..))
import Lurk.Prelude
import Paths
import Controller.Static
import Controller.Form

router :: LurkApp
router = do
    routeSettings [ TrailingSlashes, ForceSSL, ServeStatic "public" ]

    getPages allLanguages homePath homeAction
    getPages allLanguages productPath productAction
    getPages allLanguages agencyPath agencyAction
    getPages allLanguages pricingPath pricingAction
    getPages allLanguages accessPath accessAction
    getPages allLanguages thanksPath thanksAction

    getPages allLanguages termsPath (`legalAction` Terms)
    getPages allLanguages privacyPath (`legalAction` Privacy)

    postActions allLanguages accessPath accessPostAction
    postActions allLanguages enterprisePath enterprisePostAction

    notFound notFoundAction
