{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isDigit, isLetter, isSpace, toUpper)

isUpper :: String -> Bool
isUpper str =
  map toUpper str == str
    && not (all isDigit str)
    && any isLetter str

responseFor :: String -> String
responseFor str
  | isUpper s && last s == '?' = "Calm down, I know what I'm doing!"
  | isUpper s = "Whoa, chill out!"
  | null s = "Fine. Be that way!"
  | last s == '?' = "Sure."
  | otherwise = "Whatever."
 where
  s = filter (not . isSpace) str
