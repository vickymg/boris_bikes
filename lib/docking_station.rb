require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise "There are no bikes here!" unless @bike
    @bike
  end

  def dock(bike)
  	raise "No space to dock here." if @bike
  	@bike = bike
  end
end
