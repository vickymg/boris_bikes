require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:bike) }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end
end
