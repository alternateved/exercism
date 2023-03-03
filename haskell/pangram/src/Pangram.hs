module Pangram (isPangram) where

import Data.Char (isAscii, isLetter, toLower)
import Data.List (sort)
import qualified Data.List.NonEmpty as NE

alphabet :: String
alphabet = "abcdefghijklmnopqrstuvwxyz"

isPangram :: String -> Bool
isPangram =
  (== alphabet)
    . map NE.head
    . NE.group
    . sort
    . filter (\c -> isLetter c && isAscii c)
    . map toLower
