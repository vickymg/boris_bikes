class Bike

  attr_reader :working

  def initialize
    @working = true
  end

  def broken
    @working = false
    self
  end

  def fix
    @working = true
    self
  end
end
