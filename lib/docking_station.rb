require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes here!" if empty?
      bike = @bikes.pop
    raise "Bike broken" if bike.broken?
      @bike = bike
  end

  def dock(bike)
    raise "No space to dock here." if full?
    @bikes << bike
  end

  private
  def full?
  	@bikes.length >= @capacity
  end

  def empty?
  	@bikes.length == 0
  end
end
