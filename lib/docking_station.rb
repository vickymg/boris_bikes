require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available at this station!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station full!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= 20 ? true : false
  end

  def empty?
    @bikes.empty?
  end
end
