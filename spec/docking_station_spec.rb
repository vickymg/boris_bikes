require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :bikes }

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'has a default capacity that can be changed when needed' do
    station = DockingStation.new(capacity = 15)
    expect(station.capacity).to eq(15)
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).not_to be_broken
    end

    it 'raises an error if no bikes available' do
      message = 'No bikes available at this station!'
      expect{subject.release_bike}.to raise_error(message)
    end

    it 'doesn\'t release a bike that\'s broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      message = 'Sorry, this bike is broken!'
      expect{subject.release_bike}.to raise_error(message)
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if docking station full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect{subject.dock(Bike.new)}.to raise_error("Docking station full!")
    end
  end
end
