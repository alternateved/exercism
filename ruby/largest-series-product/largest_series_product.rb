class Series
  def initialize(series)
    raise ArgumentError.new if series.scan(/\D/).any?
    @series = series
  end

  def slices(n)
    raise ArgumentError.new if n > @series.length
    @series.chars.each_cons(n).map(&:join)
  end

  def largest_product(n)
    slices(n).map { |digits| digits.chars.map(&:to_i).inject(:*) }.max
  end
end
