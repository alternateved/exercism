function raindrops(number)
    s = ""
    number % 3 == 0 && (s *= "Pling")
    number % 5 == 0 && (s *= "Plang")
    number % 7 == 0 && (s *= "Plong")
    s == "" ? string(number) : s
end
