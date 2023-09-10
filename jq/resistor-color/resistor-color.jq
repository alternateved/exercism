def colors:
  ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]
;

def value:
  . as $color | colors | index($color)
;

if .property == "colorCode" then
  .input.color | value
elif .property == "colors" then
  colors
else
  "Invalid property: \(.property)" | halt_error
end
