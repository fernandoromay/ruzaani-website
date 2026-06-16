module View.Prelude
    ( module Lurk.Prelude
    , module Language
    , assetPath
    , render
    ) where

import Lurk.Prelude hiding (render)
import Lurk.Prelude qualified as Lurk
import Language

mkAssetPath "public"

render :: ((?currentPath :: Text, ?params :: [(Text, Text)]) => Html) -> Action ()
render viewHtml = do
    showLogin <- maybe False (/= "") <$> getCookie "rz_show_login"
    let params = [("showLogin", if showLogin then "true" else "false")]
    Lurk.render viewHtml params
