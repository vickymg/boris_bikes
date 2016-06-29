class Van

  CAPACITY = 5

  attr_reader :capacity, :bikes

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def load(station)
    raise "Sorry, van is full!" if full?
    @bikes << station.release_broken_bikes
  end

  def unload
    raise "No bikes to unload!" if empty?
    @bikes.pop
  end

  def collect(garage)
    @bikes << garage.fix_and_dispatch_bikes
  end

  private

  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

end
