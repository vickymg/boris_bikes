require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available at this station!' if empty?
    for i in 0...@bikes.length do
      return @bikes.shift if !@bikes[i].broken?
    end
    raise 'Sorry, this bike is broken!'
  end

  def dock(bike)
    raise "Docking station full!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end
end
