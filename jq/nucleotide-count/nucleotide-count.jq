.strand |
  if test("[^ACGT]") then
    "Invalid nucleotide in strand" | halt_error
  else
    reduce split("")[] as $nuc ({A:0, C:0, G:0, T:0}; .[$nuc] += 1)
  end
  
