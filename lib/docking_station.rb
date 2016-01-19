require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def initialize
    @bike = []
  end

  def release_bike
    raise "No bikes available" if @bike.empty?
    @bike.pop
  end

  def dock(bike)
    raise "Docking station full" if @bike.length >= 20
    @bike << bike
  end

end
