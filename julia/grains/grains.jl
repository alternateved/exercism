"""Calculate the number of grains on square `square`."""
function on_square(square)
    !(1 ≤ square ≤ 64) && throw(DomainError("invalid number"))
    UInt64(2) ^ (square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    !(1 ≤ square ≤ 64) && throw(DomainError("invalid number"))
    UInt64(2) ^ square - 1
end
