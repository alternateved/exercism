def partition(s):
  if length == 0 then
    []
  elif length < s then
    []
  else
    [.[0:s] | add] + (.[1:] | partition(s))
  end;

.sliceLength as $slice
| .series
| if length == 0 then
    "series cannot be empty" | halt_error    
  elif $slice == 0 then
    "slice length cannot be zero" | halt_error
  elif $slice < 0 then
    "slice length cannot be negative" | halt_error    
  elif $slice > length then
    "slice length cannot be greater than series length" | halt_error
  else
    split("") | partition($slice)
  end
