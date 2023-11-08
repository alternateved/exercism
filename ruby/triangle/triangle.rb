class Triangle
  def initialize(triangle)
    @a = triangle[0]
    @b = triangle[1]
    @c = triangle[2]
  end

  def valid?
    [@a, @b, @c].all?{ |el| el > 0 } &&
    @a + @b > @c &&
    @a + @c > @b &&
    @b + @c > @a
  end

  def equilateral?
    valid? && [@a, @b, @c].uniq.length == 1
  end

  def isosceles?
    valid? && (
      @a == @b ||
      @a == @c ||
      @b == @c
    )
  end

  def scalene?
    valid? && (
      @a != @b &&
      @a != @c &&
      @b != @c
    )
  end
end
