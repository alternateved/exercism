import Unicode

function myreverse(s)
    join(reverse(collect(Unicode.graphemes(s))))
end
