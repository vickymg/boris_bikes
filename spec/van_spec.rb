require 'van'

describe Van do

  it { is_expected.to respond_to :load_bikes }

  it { is_expected.to respond_to :unload_bikes }

  it 'has a capacity of 5' do
    expect(subject.capacity).to eq(Van::CAPACITY)
  end
end
