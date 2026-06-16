module Router where

import Language (allLanguages)
import Lurk.Prelude
import Paths
import Controller.Static

router :: LurkApp
router = do
    routeSettings [ TrailingSlashes, ServeStatic "public" ]

    getPages allLanguages homePath homeAction
    getPages allLanguages pricingPath pricingAction
    getPages allLanguages agencyPath agencyAction

    getPages allLanguages termsPath (`legalAction` Terms)
    getPages allLanguages privacyPath (`legalAction` Privacy)

    notFound notFoundAction
