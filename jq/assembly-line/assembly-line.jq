# Task 1: calculate the production rate per hour
def production_rate_per_hour:
  (  
    if . < 5 then 1
    elif . < 9 then 0.9
    elif . == 9 then 0.8
    else 0.77
    end
  ) * . * 221
;

# Task 2: calculate the number of working items produces per minute
def working_items_per_minute:
  production_rate_per_hour | . / 60 | floor
;


# Please don't change the line below: it is responsible for passing
# the input speed value (a number between 0 and 10 inclusive)
# to the two functions defined above.
#
.speed | (production_rate_per_hour, working_items_per_minute)
