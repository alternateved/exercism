let leap_year y = (y mod 4 = 0 && not (y mod 100 = 0)) || y mod 400 = 0
