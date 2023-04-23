function to_rna(dna)
    occursin(r"[^GCTA ]", dna) && throw(ErrorException("Unknown nucleotide"))
    replace(dna, "G" => "C", "C" => "G", "T" => "A", "A" => "U")
end
