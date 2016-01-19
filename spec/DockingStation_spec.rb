require 'DockingStation'
#require 'Bike'

describe DockingStation do
	subject(:DockingStation) {described_class.new}
  	
  	it { is_expected.to respond_to :release_bike }

  	it 'expects bike to be working in release_bike' do
  		expect(subject.release_bike.working?).to be true
  	end

  	it 'returns docked bikes' do
  		bike = Bike.new
  		subject.dock(bike)
  		expect(subject.bike).to eq bike
  	end
  	# it 'expects DockingStation.view_dock to show @bikes_in_dock' do
  	# 	expect(subject.view_dock).to eq @bikes_in_docks
  	# end

  	it { is_expected.to respond_to(:dock).with(1).argument }
  	# it 'expects bikes_in_dock to include new bike' do
  	# 	expect(subject(bikes_in_dock)).to eq
  	# end
end
