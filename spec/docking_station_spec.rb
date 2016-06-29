require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike}
  let(:van) { double :van }

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'has a default capacity that can be changed when needed' do
    station = DockingStation.new(capacity = 15)
    expect(station.capacity).to eq(15)
  end

  describe '#release_bike' do
    it 'releases a working bike' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'raises an error if no bikes available' do
      message = 'No bikes available at this station!'
      expect{subject.release_bike}.to raise_error(message)
    end

    it 'doesn\'t release a bike that\'s broken' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      message = 'Sorry, this bike is broken!'
      expect{subject.release_bike}.to raise_error(message)
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if docking station full' do
      subject.capacity.times { subject.dock(bike) }
      expect{subject.dock(bike)}.to raise_error("Docking station full!")
    end
  end

  describe '#release_broken_bikes' do
    it 'releases broken bikes' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect(subject.release_broken_bikes).to eq(bike)
    end

    it 'raises an error if no bikes are broken' do
      message = "No broken bikes to collect!"
      expect{subject.release_broken_bikes}.to raise_error(message)
    end
  end

  describe '#receive_fixed_bikes' do
    it 'receives fixed bikes from the van' do
      allow(bike).to receive(:broken?).and_return(false)
      allow(van).to receive(:deliver_working_bikes).and_return(bike)
      expect(subject.receive_fixed_bikes(van)).to include(bike)
    end
  end
end
