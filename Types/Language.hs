module Types.Language 
    ( Language(..)
    , allLanguages
    , toName
    ) where
import Data.String (IsString(..))
import Data.Text (Text)

data Language = EN | ES | KO 
    deriving (Eq, Enum, Bounded)

instance Show Language where
    show EN = "en"
    show ES = "es"
    show KO = "ko"

allLanguages :: [Language]
allLanguages = [EN, ES, KO]

instance IsString Language where
    fromString "en" = EN
    fromString "es" = ES
    fromString "ko" = KO
    fromString _    = EN 

toName :: Language -> Text
toName EN = "English"
toName ES = "Español"
toName KO = "한국어"
