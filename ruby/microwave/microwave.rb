class Microwave
  def initialize(input)
    @minutes, @seconds = input.divmod(100)
    @minutes += @seconds / 60
    @seconds %= 60
  end

  def timer
    format("%02d:%02d", @minutes, @seconds)
  end
end
