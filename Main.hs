module Main where

import Paths qualified as P (domain)
import Lurk.Prelude
import Lurk.App (Config(..))
import Router

loadConfig :: IO Config
loadConfig = do
    pure Config
        { port          = 3003
        , domain        = P.domain
        , sessionMaxAge = Nothing
        , sessionIdle   = Just 259200
        }

main :: IO ()
main = do
    loadEnv
    cfg <- loadConfig
    putStrLn $ "Starting on http://localhost:" ++ show (port cfg)
    runLurk cfg router
