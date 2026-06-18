module Config
    ( Config(..)
    , loadConfig
    ) where

import Data.Text (Text)
import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import Lurk.Env (loadEnv)
import Text.Read (readMaybe)
import Paths qualified as P (domain)

data Config = Config
    { port   :: Int
    , domain :: Text
    }

defaultPort :: Int
defaultPort = 3003

loadConfig :: IO Config
loadConfig = do
    loadEnv
    --loadEnvFile "config/secrets.env"
    portStr <- lookupEnv "PORT"
    let port = fromMaybe defaultPort (portStr >>= readMaybe)
    pure Config
        { port   = port
        , domain = P.domain
        }
