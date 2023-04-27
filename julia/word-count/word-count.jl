function wordcount(sentence)
    dict = Dict()
    words = sentence |>
        lowercase |>
        s -> replace(s, r"(?!\b'\b)[^\w ]" => " ") |>
        s -> split(s, " ") |>
        s -> filter(!isempty, s)

    for word in words
        haskey(dict, word) ? dict[word] += 1 : dict[word] = 1
    end

    return dict
end
