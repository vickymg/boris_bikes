require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:station) { double :docking_station }
  let(:garage) { double :garage }

  it 'has a maximum capacity' do
    expect(subject.capacity).to eq(Van::CAPACITY)
  end

  describe '#load' do
    it 'loads a bike' do
      allow(station).to receive(:release_broken_bikes).and_return(bike)
      subject.load(station)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if van is full' do
      allow(station).to receive(:release_broken_bikes).and_return(bike)
      subject.capacity.times { subject.load(station) }
      expect{ subject.load(bike) }.to raise_error("Sorry, van is full!")
    end
  end

  describe '#unload' do
    it 'unloads bikes' do
      allow(station).to receive(:release_broken_bikes).and_return(bike)
      subject.load(station)
      expect(subject.unload).to eq(bike)
    end

    it 'raises an error if there are no bikes to unload' do
      expect{ subject.unload }.to raise_error("No bikes to unload!")
    end
  end

  describe '#collect' do
    it 'collects working bikes from the garage' do
      allow(garage).to receive(:fix_and_dispatch_bikes).and_return(bike)
      subject.collect(garage)
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#deliver_working_bikes' do
    it 'delivers working bikes to the docking station' do
      allow(garage).to receive(:fix_and_dispatch_bikes).and_return(bike)
      allow(bike).to receive(:broken?).and_return(false)
      subject.collect(garage)
      expect(subject.deliver_working_bikes).to eq(bike)
    end
  end

end
