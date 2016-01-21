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
    expect(subject.dock(bike)).to include bike
  end

  describe '#release_bike' do

    let(:bike) { Bike.new }

    it 'raises an error if there are no bikes' do
      expect{subject.release_bike}.to raise_error("No bikes")
    end

    it 'will not release a broken bike' do
      bike.broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("bike is broken")
    end

    it 'will release a working bike and not a broken bike' do
      bike_two = Bike.new
      bike_two.broken
      subject.dock(bike_two)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  end

  describe '#dock' do

    let(:bike) { Bike.new }

    it 'raises an error if at capacity' do
      subject.capacity.times { subject.dock Bike.new }
      expect{subject.dock(bike)}.to raise_error("Dock full")
    end

    it 'docks broken bikes' do
      bike.broken
      expect(subject.dock(bike)).to include bike
    end

  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'checks if capacity can be set' do
    expect(DockingStation.new(3).capacity).to eq 3
  end




end
