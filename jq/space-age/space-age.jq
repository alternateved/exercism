# input: a floating point number
# output: the number rounded to two decimal places
def two_decimal: ((. * 100) | round) / 100;

def year_on_planet:
  if . == "Mercury" then
    0.2408467
  elif . == "Venus" then
    0.61519726
  elif . == "Earth" then
    1
  elif . == "Mars" then
    1.8808158
  elif . == "Jupiter" then
    11.862615
  elif . == "Saturn" then
    29.447498
  elif . == "Uranus" then
    84.016846
  elif . == "Neptune" then
    164.79132
  else
    "not a planet" | halt_error
  end * 31557600;

.seconds / (.planet | year_on_planet) | two_decimal
