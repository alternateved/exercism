class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons((first, second, locomotive, *rest), missing_wagons)
    [locomotive, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(route, **stops)
    {**route, stops: stops.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
