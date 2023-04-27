function isisogram(s)
    filter(isletter, lowercase(s)) |> allunique
end
