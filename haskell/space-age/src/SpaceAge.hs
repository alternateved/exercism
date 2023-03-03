module SpaceAge (Planet (..), ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

earthYear :: Float
earthYear = 31557600

ageOn :: Planet -> Float -> Float
ageOn = calculateAge . byYear
 where
  byYear p = case p of
    Mercury -> 0.2408467 * earthYear
    Venus -> 0.61519726 * earthYear
    Earth -> earthYear
    Mars -> 1.8808158 * earthYear
    Jupiter -> 11.862615 * earthYear
    Saturn -> 29.447498 * earthYear
    Uranus -> 84.016846 * earthYear
    Neptune -> 164.79132 * earthYear

  calculateAge y s =
    (/ 100) . fromIntegral . round . (* 100) $ s / y
