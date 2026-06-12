module Locales.Home where

import Locales.Prelude

data HomeLocale = HomeLocale
    { seo     :: SEO
    , title   :: Text
    , message :: Text
    } 

getLocale :: Language -> HomeLocale
getLocale EN = HomeLocale
    { seo = defaultSEO
        { title = "Welcome to LURK"
        , metaTitle = "Welcome to LURK"
        , metaDescription = "A lightweight, Nix-free Haskell web framework."
        }
    , title = "Welcome to LURK"
    , message = "A lightweight, Nix-free Haskell web framework."
    }
getLocale ES = HomeLocale
    { seo = defaultSEO
        { title = "Bienvenido a LURK"
        , metaTitle = "Bienvenido a LURK"
        , metaDescription = "Un framework web de Haskell ligero y sin Nix."
        }
    , title = "Bienvenido a LURK"
    , message = "Un framework web de Haskell ligero y sin Nix."
    }
getLocale KO = HomeLocale
    { seo = defaultSEO
        { title = "LURK에 오신 것을 환영합니다"
        , metaTitle = "LURK에 오신 것을 환영합니다"
        , metaDescription = "가볍고 Nix 없는 하스켈 웹 프레임워크."
        }
    , title = "LURK에 오신 것을 환영합니다"
    , message = "가볍고 Nix 없는 하스켈 웹 프레임워크."
    }
