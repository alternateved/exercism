def double_digit: . * 2 | if . > 9 then . - 9 else . end;

def map_every_other(f;i):
  if i >= length then
    []
  elif i % 2 == 1 then
    [.[i] | f] + (. | map_every_other(f; i + 1))
  else
    [.[i]] + (. | map_every_other(f; i + 1))
  end;

test("^[\\d ]+$";"g") and
  (
    gsub(" "; "")
    | split("")
    | map(tonumber) 
    | reverse
    | map_every_other(double_digit; 0) 
    | length > 1 and add % 10 == 0
  )

