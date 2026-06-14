module Main where

import Config (loadConfig, port)
import Lurk.Prelude (runLurk)
import Router (router)

main :: IO ()
main = do
    cfg <- loadConfig
    putStrLn $ "Starting on port " <> show (port cfg) <> "..."
    runLurk (port cfg) router
