require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :bike }

  it 'checks if the bike has been docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes' do
      expect{subject.release_bike}.to raise_error("No bikes")
    end
  end

  describe '#dock' do
    it 'raises an error if there is already a bike' do
      bike = Bike.new
      subject.dock(bike)
      bike_2 = Bike.new
      expect{subject.dock(bike_2)}.to raise_error("Dock full")
    end
  end

end
