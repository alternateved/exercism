def reverse:
  if . == "" then ""
  else .[-1:] + ( .[:-1] | reverse)
  end
;

.value | reverse
