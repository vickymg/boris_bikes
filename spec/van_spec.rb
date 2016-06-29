require 'van'

describe Van do

  let(:bike) { double :bike }

  it { is_expected.to respond_to :load }

  it { is_expected.to respond_to :unload }

  it 'has a capacity of 5' do
    expect(subject.capacity).to eq(Van::CAPACITY)
  end

  it 'loads a bike' do
    subject.load(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'unloads bikes' do
    subject.load(bike)
    expect(subject.unload).to eq(bike)
  end
end
