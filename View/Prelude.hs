module View.Prelude
    ( module Lurk.Prelude
    , module Language
    , ViewCtx
    , paramValue
    , assetPath
    , render
    ) where

import Lurk.Prelude hiding (ViewCtx, render)
import Data.Text.Lazy qualified as TL
import Lurk.CSRF
import Language

mkAssetPath "public"

type ViewCtx lang = (?currentPath :: Text, ?csrfToken :: Text, ?params :: [(Text, Text)], ?lang :: lang)

render :: ((?currentPath :: Text, ?csrfToken :: Text, ?params :: [(Text, Text)]) => Html) -> Action ()
render viewHtml = do
    showLogin <- maybe False (/= "") <$> getCookie "rz_show_login"
    let params =
            [ ("showLogin", if showLogin then "true" else "false")
            ]
    uri <- currentPath
    token <- csrfToken
    let ?currentPath = uri
        ?params = params
        ?csrfToken = token
    html . TL.fromStrict . renderHtml $ viewHtml

paramValue :: (?params :: [(Text, Text)]) => Text -> Maybe Text
paramValue key = lookup key ?params