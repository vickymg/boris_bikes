require_relative 'Bike.rb'

class DockingStation

	attr_accessor :bike, :bikes_in_dock

	#def initialize(bikes_in_dock = 0)
	  # self.bikes_in_dock = bikes_in_dock
	#end

	def release_bike
		raise "There are no bikes in the dock" unless @bike
		#@bikes_in_dock -= 1
		@bike
	end

	def dock(bike)
		@bike = bike
		#@bikes_in_dock += 1
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
