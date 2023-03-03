module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz num
  | num < 1 = Nothing
  | otherwise =
      let step n = if even n then n `div` 2 else n * 3 + 1
       in Just $ toInteger $ length $ takeWhile (> 1) $ iterate step num
