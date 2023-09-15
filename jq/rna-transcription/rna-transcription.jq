def complement:
  if . == "G" then "C"
  elif . == "C" then "G"
  elif . == "T" then "A"
  elif . == "A" then "U"
  else "Invalid nucleotide in strand" | halt_error
  end;

def toRna: split("") | map(complement) | join("");
