module Router where

import Language (allLanguages, Language(..))
import Lurk.Prelude
import Paths
import Controller.Static
import Controller.Forms

router :: LurkApp
router = do
    routeSettings [ TrailingSlashes, ServeStatic "public" ]

    getPages allLanguages homePath homeAction
    getPages allLanguages productPath productAction
    getPages allLanguages agencyPath agencyAction
    getPages allLanguages pricingPath pricingAction
    getPages allLanguages accessPath accessAction
    getPages allLanguages thanksPath thanksAction

    getPages allLanguages termsPath (`legalAction` Terms)
    getPages allLanguages privacyPath (`legalAction` Privacy)

    postAction (accessPath EN) (accessPostAction EN)
    postAction (accessPath ES) (accessPostAction ES)
    postAction (accessPath KO) (accessPostAction KO)

    postAction (enterprisePath EN) (enterprisePostAction EN)
    postAction (enterprisePath ES) (enterprisePostAction ES)
    postAction (enterprisePath KO) (enterprisePostAction KO)

    notFound notFoundAction
