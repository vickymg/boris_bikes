require_relative 'Bike.rb'

class DockingStation 
	attr_accessor :bike
	# @bikes_in_docks = []
	def initialize
	   @bikes_in_dock = []
	end

	def release_bike 
		# @new_bike = 
		Bike.new
	end

	def dock(bike)
		@bike = bike
		@bikes_in_dock << bike
	end

	def view_dock
		@bikes_in_dock
	end
end

station = DockingStation.new

bike1 = station.release_bike

station.dock(bike1)

bike2 = station.release_bike

station.dock(bike2)

puts station.view_dock

bike3 = station.release_bike

station.dock(bike3)

bike4 = station.release_bike

station.dock(bike4)

puts

puts

puts station.view_dock

