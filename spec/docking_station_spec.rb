require 'docking_station'
require 'bike'

describe DockingStation do

    # expects instances of DockingStation to respond to a method dock,
    # with one argument passed in
    it { is_expected.to respond_to(:dock).with(1).argument }


    # Call 'dock' method on instances of DockingStation, and
    # pass argument as variable 'bike' (creating new instance of Bike)
    # expect instance variable bike to equal to argument bike
  describe '#release_bike' do
      # it 'releases a bike' do
      #   bike = Bike.new
      #   subject.dock(bike)
      #   expect(subject.bike).to eq bike
      # end

    # expect an error to be raised when release_bike method is called on
    # instances of DockingStation
      it "raises an error when there are no bikes available" do
        expect {subject.release_bike}.to raise_error("No bikes available")
      end
    end

    describe '#dock' do
      it "raises an error when the docking station is at capacity" do
        20.times {subject.dock Bike.new}
        expect { subject.dock Bike.new }.to raise_error("Docking station full")
      end
    end
    #instances of DockingStation should respond to release_bike method
    it { should respond_to :release_bike }

end
