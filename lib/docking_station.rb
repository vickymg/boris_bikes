require_relative 'bike'

class DockingStation

	def initialize
		@docked_bike = nil
	end

	attr_reader :docked_bike

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
  	@docked_bike = bike
  end
end
