function sum_of_multiples(limit, factors)
    factors = filter(≠(0), factors)
    multiples = f -> filter(x -> x % f == 0, 0:limit - 1)
    
    map(multiples, factors) |>
        Iterators.flatten |>
        unique |>
        a -> sum(a; init=zero(limit))
end
