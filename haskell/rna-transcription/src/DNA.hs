{-# LANGUAGE LambdaCase #-}

module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = mapM transcribe
 where
  transcribe =
    \case
      'G' -> Right 'C'
      'C' -> Right 'G'
      'T' -> Right 'A'
      'A' -> Right 'U'
      x -> Left x
