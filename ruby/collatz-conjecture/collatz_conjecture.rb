module CollatzConjecture
  def self.steps(n)
    raise ArgumentError.new unless n.positive?

    if n == 1
      0
    elsif n % 2 == 0
      1 + steps(n / 2)
    else
      1 + steps(n * 3 + 1)
    end
  end
end
