require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end


  def release_bike
    raise "No bikes" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Dock full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count == 0
  end

end
