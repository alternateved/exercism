def intersperse(c;n;i):
  if i >= length then
    []
  elif i != 0 and i % n == 0 then
    [c + .[i]] + (. | intersperse(c;n;i + 1))
  else
    [.[i]] + (. | intersperse(c;n;i + 1))
  end;

def encode:
  . as $v
    | {
      a:"z", b:"y", c:"x", d:"w", e:"v", f:"u", g:"t",
      h:"s", i:"r", j:"q", k:"p", l:"o", m:"n", n:"m",
      o:"l", p:"k", q:"j", r:"i", s:"h", t:"g", u:"f",
      v:"e", w:"d", x:"c", y:"b", z:"a"
    } | .[$v] // $v;

def decode:
  . as $v
    | {
      z:"a", y:"b", x:"c", w:"d", v:"e", u:"f", t:"g",
      s:"h", r:"i", q:"j", p:"k", o:"l", n:"m", m:"n",
      l:"o", k:"p", j:"q", i:"r", h:"s", g:"t", f:"u",
      e:"v", d:"w", c:"x", b:"y", a:"z"
    } | .[$v] // $v;

.property as $property
| .input.phrase
| gsub("[^\\w]"; "")
| split("")
| map(ascii_downcase)
| if $property == "encode" then
    map(encode) | intersperse(" ";5;0)
  else
    map(decode)
  end
| add
