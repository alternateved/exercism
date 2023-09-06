hypot(.x;.y) as $distance |
  if $distance > 10 then 0
  elif $distance > 5 then 1
  elif $distance > 1 then 5
  else 10
  end
