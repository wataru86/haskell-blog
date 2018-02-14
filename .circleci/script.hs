#!/usr/bin/env stack
-- stack --resolver lts-10.5 script
{-# LANGUAGE OverloadedStrings #-}

module Main where

--import Data.Maybe
import System.Environment
import Turtle
-- Turtle, reqを追加

main :: IO ()
main = do
  pullRequestUrl <- lookupEnv "CIRCLE_PULL_REQUEST"
  maybe (putStrLn "This build is not PR.") main' pullRequestUrl

main' :: String -> IO ()
main' pullRequestUrl = do
  putStrLn ("PR: " ++ pullRequestUrl)
  -- turtleでstack buildなど
  -- roqでコメント
