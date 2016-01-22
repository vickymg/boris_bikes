
require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(station)
    @bikes = station.bikes.select! do |bike|
      !bike.working
    end
  end

  def deliver_bikes(garage)
    garage.receive_bikes(@bikes)
    @bikes = []
  end

  def collect_working_bikes(garage)
    @bikes = garage.bikes.select do |bike|
      bike.working
    end
    garage.bikes.clear
  end

  def deliver_working_bikes_to_dock(station)
    # raise "You can't return broken bikes to a dock" if @bikes.
  end

end
