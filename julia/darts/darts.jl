function score(x, y)
    distance = hypot(x, y)
    distance > 10 && return 0
    distance > 5  && return 1
    distance > 1  && return 5
    return 10
end
