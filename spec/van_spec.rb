require 'van'

describe Van do

  let(:bike) { double :bike }

  it { is_expected.to respond_to :load }

  it { is_expected.to respond_to :unload }

  it 'has a capacity of 5' do
    expect(subject.capacity).to eq(Van::CAPACITY)
  end

  describe '#load' do
    it 'loads a bike' do
      subject.load(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if van is full' do
      subject.capacity.times { subject.load(bike) }
      expect{ subject.load(bike) }.to raise_error("Sorry, van is full!")
    end
  end

  describe '#unload' do
    it 'unloads bikes' do
      subject.load(bike)
      expect(subject.unload).to eq(bike)
    end

    it 'raises an error if there are no bikes to unload' do
      expect{ subject.unload }.to raise_error("No bikes to unload!")
    end
  end

end
