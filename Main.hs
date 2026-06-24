module Main where

import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Lurk.Env
import Paths qualified as P (domain)
import Lurk.Prelude (runLurk)
import Router (router)

data Config = Config
    { port   :: Int
    , domain :: Text
    }

defaultPort :: Int
defaultPort = 3003

loadConfig :: IO Config
loadConfig = do
    env <- loadEnv
    pure Config
        { port   = fromMaybe defaultPort (getEnvInt env "PORT")
        , domain = P.domain
        }

main :: IO ()
main = do
    cfg <- loadConfig
    putStrLn $ "Starting on http://localhost:" ++ show (port cfg)
    runLurk (port cfg) router
