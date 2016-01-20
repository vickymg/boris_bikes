require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes here!" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise "No space to dock here." if @bikes.length >= 20
    @bikes << bike
  end
end
