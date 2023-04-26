function transform(input::AbstractDict)
    output = Dict()
    
    for (key, vec) in input
        for k in lowercase.(vec)
            output[k] = key
        end
    end
    
    return output
end
