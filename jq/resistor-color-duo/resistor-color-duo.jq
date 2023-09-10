def colors:
  ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]
;

def value:
  . as $color | colors | index($color)
;

.colors[:2] | map(value) | map(tostring) | add | tonumber
