module View.Prelude
    ( module Lurk.Prelude
    , module Language
    , ViewCtx
    , paramValue
    , assetPath
    , render
    ) where

import Lurk.Prelude hiding (ViewCtx, render)
import Lurk.Request (fetchCurrentPath)
import Lurk.CSRF (fetchCsrfToken)
import Lurk.Flash (getFlash)
import Lurk.Validate (getValidationErrors)
import Data.Text.Lazy qualified as TL
import Language

mkAssetPath "public"

type ViewCtx lang = (?ctx :: ViewContext, ?params :: [(Text, Text)], ?lang :: lang)

render :: ((?ctx :: ViewContext, ?params :: [(Text, Text)]) => Html) -> Action ()
render viewHtml = do
    showLogin <- maybe False (/= "") <$> getCookie "rz_show_login"
    let params =
            [ ("showLogin", if showLogin then "true" else "false")
            ]
    uri <- fetchCurrentPath
    tokn <- fetchCsrfToken
    flsh <- getFlash
    errs <- getValidationErrors
    let ?ctx = ViewContext
            { vcCurrentPath = uri
            , vcCsrfToken   = tokn
            , vcFlash       = flsh
            , vcValidation  = errs
            }
        ?params = params
    html . TL.fromStrict . renderHtml $ viewHtml

paramValue :: (?params :: [(Text, Text)]) => Text -> Maybe Text
paramValue key = lookup key ?params
