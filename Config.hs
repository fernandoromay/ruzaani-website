module Config
    ( Config(..)
    , loadConfig
    ) where

import Data.Text (Text)
import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import Text.Read (readMaybe)

data Config = Config
    { port   :: Int
    , domain :: Text
    }

defaultPort :: Int
defaultPort = 3000

loadConfig :: IO Config
loadConfig = do
    portStr <- lookupEnv "PORT"
    let port = fromMaybe defaultPort (portStr >>= readMaybe)
    pure Config
        { port   = port
        , domain = "https://ruzaani.com"
        }
