function detect_anagrams(subject, candidates)
    f = s -> s |> lowercase |> collect |> sort
    filter(c -> lowercase(c) ≠ lowercase(subject) && f(c) == f(subject), candidates)
end
