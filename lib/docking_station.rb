require_relative 'bike'

class DockingStation

  attr_reader :bike

  def intialize
    @bike = []
  end


  def release_bike
    raise "No bikes" unless @bike
    @bike.pop
  end

  def dock(bike)
    raise "Dock full" if @bike.length >= 20
    @bike << bike
  end

end
