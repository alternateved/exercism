class Series
  def initialize(str)
    @series = str
  end

  def slices(n)
    raise ArgumentError.new if n > @series.length
    @series.chars.each_cons(n).map(&:join)
  end
end
