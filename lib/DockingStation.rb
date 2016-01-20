require_relative 'Bike.rb'

class DockingStation 

	attr_accessor :bike

	def initialize(number_of_bikes)
	   @bikes_in_dock = 1
	end

	def release_bike 
		raise "There are no bikes in the dock" if @bikes_in_dock == 0
		@bikes_in_dock -= 1 
		Bike.new
	end

	def dock(bike)
		@bike = bike
		@bikes_in_dock += 1 
	end

	# def view_dock
	# 	@bikes_in_dock
	# end
end

# station = DockingStation.new

# bike1 = station.release_bike

# station.dock(bike1)

# bike2 = station.release_bike

# station.dock(bike2)

# puts station.view_dock

# bike3 = station.release_bike

# station.dock(bike3)

# bike4 = station.release_bike

# station.dock(bike4)

# puts

# puts

# puts station.view_dock

