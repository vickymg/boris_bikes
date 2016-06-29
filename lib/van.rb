class Van

  CAPACITY = 5

  attr_reader :capacity, :bikes

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def load(bike)
    raise "Sorry, van is full!" if full?
    @bikes << bike
  end

  def unload
    raise "No bikes to unload!" if empty?
    @bikes.pop
  end

  private

  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

end
