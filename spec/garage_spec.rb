require 'garage'

describe Garage do

  describe '#initialize' do
    it { is_expected.to respond_to(:bikes) }

    it 'initializes with no bikes' do
      expect(subject.bikes).to be_empty
    end
  end

  describe '#receive_bikes' do
    it { is_expected.to respond_to(:receive_bikes).with(1).argument }

    let(:bike) { double :bike }
    let(:van) { double(:van, :bikes => [bike]) }

    it 'receives broken bikes from a van' do
      allow(bike).to receive(:fix).and_return(bike)
      expect(subject.receive_bikes(van.bikes)).to eq [bike]
    end

    it 'fixes received bikes' do
      expect(bike).to receive(:fix)

      subject.receive_bikes([bike])
    end
  end



end
