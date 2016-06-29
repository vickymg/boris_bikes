class Van

  CAPACITY = 5

  attr_reader :capacity, :bikes

  def initialize(capacity = CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def load(bike)
    @bikes << bike
  end

  def unload
    @bikes.pop
  end

end
