class Garage

  attr_reader :bikes, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def receive(van)
    @bikes << van.unload
  end

end
