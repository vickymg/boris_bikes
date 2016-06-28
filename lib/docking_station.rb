require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available at this station!" unless @bikes.any?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station full!" if @bikes.length >= 20
    @bikes << bike
  end

end
