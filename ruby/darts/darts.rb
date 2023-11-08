class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    distance = Math.hypot(@x, @y)

    case distance
    when 0..1 then 10
    when 1..5 then 5
    when 5..10 then 1
    else 0
    end
  end
end
