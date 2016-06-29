require 'garage'

describe Garage do

  let(:bike) { double :bike }
  let(:van) { double :van }

  it 'has a maximum capacity' do
    expect(subject.capacity).to eq(Garage::CAPACITY)
  end

  describe '#receive' do
    it 'receives bikes' do
      allow(van).to receive(:unload).and_return(bike)
      allow(bike).to receive(:fix).and_return(false)
      subject.receive(van)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if garage is full' do
      allow(van).to receive(:unload).and_return(bike)
      allow(bike).to receive(:fix).and_return(false)
      subject.capacity.times { subject.receive(van) }
      expect{subject.receive(van)}.to raise_error('Garage is full!')
    end
  end

  describe '#fix_bikes' do
    it 'fixes the bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      allow(van).to receive(:unload).and_return(bike)
      subject.receive(van)
      allow(bike).to receive(:fix).and_return(false)
      expect(subject.fix_bikes).to include(bike)
    end
  end

end
