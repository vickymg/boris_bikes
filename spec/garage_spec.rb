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
      subject.receive(van)
      expect(subject.bikes).to include(bike)
    end

    
  end

end
