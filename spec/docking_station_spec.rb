require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'returns a working Bike' do
    expect(subject.release_bike).to be_working
  end

  it {is_expected.to respond_to :dock}
  it 'docks a bike' do
    test_bike = Bike.new
    expect(subject.dock(test_bike)).to eq test_bike
  end

  it {is_expected.to respond_to :bike}
  it 'returns docked bike' do
    test_bike = Bike.new
    subject.dock(test_bike)
    expect(subject.bike).to eq test_bike
  end
end
