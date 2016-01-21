
require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(station)
    @bikes = station.bikes.select do |bike|
      !bike.working
    end
  end

  def deliver_bikes(garage)

  end

end
