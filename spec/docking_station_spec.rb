require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'returns a working Bike' do
    expect(subject.release_bike).to be_working
  end

  it 'docks a bike' do
    station = DockingStation.new
    bike = Bike.new
    allow(station).to receive(:dock_bike).and_return(bike)
    expect(station.bike).to eq bike
  end
end
