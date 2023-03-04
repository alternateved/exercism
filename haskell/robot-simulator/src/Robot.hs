module Robot (Bearing (..), bearing, coordinates, mkRobot, move) where

import Data.List (foldl')

data Bearing
  = North
  | East
  | South
  | West
  deriving (Bounded, Enum, Eq, Show)

type Coordinates = (Integer, Integer)

data Robot = Robot
  { bearing :: Bearing
  , coordinates :: Coordinates
  }

prev :: (Eq a, Enum a, Bounded a) => a -> a
prev x = if x == minBound then maxBound else pred x

next :: (Eq a, Enum a, Bounded a) => a -> a
next x = if x == maxBound then minBound else succ x

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move = foldl' interpret

interpret :: Robot -> Char -> Robot
interpret (Robot dir coords) c =
  case c of
    'L' -> Robot (prev dir) coords
    'R' -> Robot (next dir) coords
    _ -> Robot dir (advance dir coords)

advance :: Bearing -> Coordinates -> Coordinates
advance dir (x, y) =
  case dir of
    North -> (x, y + 1)
    South -> (x, y - 1)
    East -> (x + 1, y)
    West -> (x - 1, y)
