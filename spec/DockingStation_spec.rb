require 'DockingStation'

describe DockingStation do
	subject(:DockingStation) {described_class.new}
  	
  	it { is_expected.to respond_to :release_bike }

  	it 'expects bike to be working in release_bike' do
  		expect(subject.release_bike).to be_working
  	end

  	it 'returns docked bikes' do
  		bike = Bike.new
  		subject.dock(bike)
  		expect(subject.bike).to eq bike
  	end

  	it { is_expected.to respond_to(:dock).with(1).argument }

  	it 'expects release_bike to raise an error' do
  	expect{subject.release_bike}.to raise_error("There are no bikes in the dock")
  	end 

end
