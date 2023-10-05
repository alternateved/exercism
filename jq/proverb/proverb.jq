def proverb(f):
  if isempty(.[]) then
    []
  elif length >= 2 then
    ["For want of a \(.[0]) the \(.[1]) was lost."] + (.[1:] | proverb(f))
  else
    ["And all for the want of a \(f)."]
  end;

.strings | first as $f | proverb($f)
