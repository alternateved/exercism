.moment as $m
| try   ($m | strptime("%Y-%m-%d"))
  catch ($m | strptime("%Y-%m-%dT%H:%M:%S"))
| mktime
| . + pow(10; 9)
| strftime("%Y-%m-%dT%H:%M:%S") 







