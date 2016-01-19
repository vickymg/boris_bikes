require 'docking_station'
require 'bike'

describe DockingStation do
  it { should respond_to :release_bike }

    it "releases bike" do
      bike = subject.release_bike
      expect(bike).to be_working
  end
end
