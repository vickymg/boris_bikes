require 'DockingStation'

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

  	it { is_expected.to respond_to(:dock).with(1).argument }
end
