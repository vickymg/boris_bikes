require 'docking_station'
require 'bike'

describe DockingStation do

  describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
      end

    #instances of DockingStation should respond to release_bike method
    it { should respond_to :release_bike }

end
