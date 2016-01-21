
require_relative 'docking_station'

class Van

  def collect_bikes(station)
    station.bikes.select do |bike|
      !bike.working
    end
  end

end
