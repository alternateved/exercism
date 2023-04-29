"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    counter = Dict(base => 0 for base in "ACGT")

    for n in strand
        if haskey(counter, n)
            counter[n] += 1
        else
            throw(DomainError("strand with invalid nucleotide(s)"))
        end
    end
    
    return counter
end
