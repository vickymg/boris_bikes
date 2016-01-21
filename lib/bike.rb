class Bike

  attr_reader :working

  def initialize
    @working = true
  end

  def broken
    @working = false
  end

  def fix
    @working = true
    self
  end
end
