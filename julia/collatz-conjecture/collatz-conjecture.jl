function collatz_steps(n)
    n < 1 && throw(DomainError("number lower than 1"))
    step = 0

    while n > 1
        n = iseven(n) ? n ÷ 2 : 3n + 1
        step += 1
    end

    return step
end
