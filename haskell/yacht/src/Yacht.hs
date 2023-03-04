module Yacht (yacht, Category (..)) where

import Data.List (group, sort)

data Category
  = Ones
  | Twos
  | Threes
  | Fours
  | Fives
  | Sixes
  | FullHouse
  | FourOfAKind
  | LittleStraight
  | BigStraight
  | Choice
  | Yacht

yacht :: Category -> [Int] -> Int
yacht cat dice =
  case cat of
    Ones -> length (filter (== 1) dice)
    Twos -> length (filter (== 2) dice) * 2
    Threes -> length (filter (== 3) dice) * 3
    Fours -> length (filter (== 4) dice) * 4
    Fives -> length (filter (== 5) dice) * 5
    Sixes -> length (filter (== 6) dice) * 6
    FullHouse -> if (sort . map length . group $ sort dice) == [2, 3] then sum dice else 0
    FourOfAKind -> sum . take 4 . concat . filter (\x -> length x > 3) . group $ sort dice
    LittleStraight -> if sort dice == [1, 2, 3, 4, 5] then 30 else 0
    BigStraight -> if sort dice == [2, 3, 4, 5, 6] then 30 else 0
    Choice -> sum dice
    Yacht -> if all (== head dice) (tail dice) then 50 else 0
