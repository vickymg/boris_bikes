require "docking_station"

describe DockingStation do
	test_station = DockingStation.new
  test_bike = Bike.new
  test_station.dock_bike(test_bike)

  it { is_expected.to respond_to :release_bike }

  it 'returns a working Bike' do
    expect(subject.release_bike).to be_working
  end

  it {is_expected.to respond_to :dock_bike}

  it 'docks a bike' do
    expect(test_station.docked_bike).to eq test_bike
  end
end
