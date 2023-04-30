function distance(a, b)
    length(a) ≠ length(b) && throw(ArgumentError("different strand lenghts"))
    count(a ≠ b for (a, b) in zip(a, b))
end
