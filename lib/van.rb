require_relative 'docking_station'
require_relative 'bike'

class Van

  attr_reader :broken_bikes

    @broken_bikes = []

  def pickup
    @bikes.each do |bike|
      broken_bikes << bike if bike.broken?
    end
  end

end
