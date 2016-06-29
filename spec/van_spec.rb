require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:station) { double :docking_station }

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

end
