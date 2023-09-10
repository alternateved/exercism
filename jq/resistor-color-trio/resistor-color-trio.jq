def colors:
  ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]
;

def value:
  . as $color | colors | index($color)
;

def get_prefix:
  if . < (3 | exp10) then
    {"value": .,
      "unit": "ohms"
    }
  elif . < (6 | exp10) then
    {"value": ((. / (3 | exp10)) | round),
      "unit": "kiloohms"
    }
  elif . < (9 | exp10) then
    {"value": ((. / (6 | exp10)) | round),
      "unit": "megaohms"
    }
  elif . < (12 | exp10) then
    {"value": ((. / (9 | exp10)) | round),
      "unit": "gigaohms"
    }
  else
    "Higher numbers are not supported" | halt_error    
  end
;

def translate:
  [(.[:2] | add) , (.[2:3] | .[0] | tonumber | "0" * . )] | add | tonumber
;

.colors | map(value) | map(tostring) | translate | get_prefix
