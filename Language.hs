module Language
    ( Language(..)
    , allLanguages
    , fromText
    , toText
    , toName
    , langPaths
    ) where

import Lurk.Language

data Language = EN | ES | KO
    deriving (Eq, Enum, Bounded, Data)

toName :: Language -> Text
toName EN = "English"
toName ES = "Español"
toName KO = "한국어"