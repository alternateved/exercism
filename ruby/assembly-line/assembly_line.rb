class AssemblyLine
  CARS_PRODUCED_PER_HOUR = 221
  
  def initialize(speed)
    @speed = speed
    @success_rate = case @speed
                    when 1, 2, 3, 4 then 1.0
                    when 5, 6, 7, 8 then 0.9
                    when 9 then 0.8
                    when 10 then 0.77
                    end
  end

  def production_rate_per_hour
  @speed * @success_rate * CARS_PRODUCED_PER_HOUR
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
