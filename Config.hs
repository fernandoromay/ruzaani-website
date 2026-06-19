module Config (Config(..), loadConfig) where

import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Lurk.Env
import Paths qualified as P (domain)

data Config = Config
    { port   :: Int
    , domain :: Text
    }

defaultPort :: Int
defaultPort = 3003

loadConfig :: IO Config
loadConfig = do
    env <- loadEnv -- Reads .env file in root directory
    --loadEnvFile "config/secrets.env"
    pure Config
        { port   = fromMaybe defaultPort (getEnvInt env "PORT")
        , domain = P.domain
        }
