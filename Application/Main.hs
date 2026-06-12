module Main where

import Web.Scotty
import Routes (routes)

main :: IO ()
main = do
    putStrLn "Starting LURK Framework on port 3000..."
    scotty 3000 routes
