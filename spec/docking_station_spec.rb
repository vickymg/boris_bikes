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

  it { is_expected.to respond_to :bikes }

  it 'checks if the bike has been docked' do
    bike = Bike.new
    bikes = []
    expect(subject.dock(bike)).to eq [bike]
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes' do
      expect{subject.release_bike}.to raise_error("No bikes")
    end
  end

  describe '#dock' do
    it 'raises an error if at capacity' do
      subject.capacity.times { subject.dock Bike.new }
      expect{subject.dock(Bike.new)}.to raise_error("Dock full")
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'checks if capacity can be set' do
    expect(DockingStation.new(3).capacity).to eq 3
  end

end
