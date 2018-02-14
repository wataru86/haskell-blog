#!/usr/bin/env stack
-- stack --resolver lts-10.5 script
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment
import Turtle
-- reqを追加

main :: IO ()
main = do
  setEnv "CIRCLE_PULL_REQUEST" "test_url" -- test
  pullRequestUrl <- lookupEnv "CIRCLE_PULL_REQUEST"
  maybe (putStrLn "This build is not PR.") main' pullRequestUrl

main' :: String -> IO ()
main' pullRequestUrl = do
  putStrLn ("PR: " ++ pullRequestUrl)
  view pwd
  view $ shell "stack build" empty
  view $ shell "stack exec site rebuild" empty
  -- roqでコメント
