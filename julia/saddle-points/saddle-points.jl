function saddlepoints(M)
    isempty(M) && return []
    row_max = maximum(M, dims=2)
    col_min = minimum(M, dims=1)
    Tuple.(findall(row_max .== col_min))
end
