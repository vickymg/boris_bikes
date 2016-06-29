class Garage

  attr_reader :bikes, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def receive(van)
    raise 'Garage is full!' if full?
    @bikes << van.unload
  end

  def fix_and_dispatch_bikes
    raise 'No bikes to dispatch!' if empty?
    @bikes.each { |bike| bike.fix }
    @bikes
  end

  private

  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

end
