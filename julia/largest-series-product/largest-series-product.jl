function largest_product(str, span)
    if iszero(span)
        return 1
    elseif span ∉ 0:length(str)
        throw(ArgumentError("Span must be in the range 0:length(str)"))
    elseif !all(isdigit, str)
        throw(ArgumentError("Non-digit character in str"))
    end

    numbers = parse.(Int64, split(str,""))
    return maximum(1:(length(numbers) - span + 1)) do left
        right = left + span - 1
        prod(view(numbers, left:right))
    end
end
