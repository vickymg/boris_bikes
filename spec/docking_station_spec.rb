require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'returns a working Bike' do
    test_bike = Bike.new
    subject.dock(test_bike)
    expect(subject.release_bike).to be_working
  end

  it "doesn't release a bike if there are none available" do
    expect {subject.release_bike}.to raise_error("There are no bikes here!")
  end

  it "doesn't dock a bike if over capacity" do
  	test_bike = Bike.new
  	subject.dock(test_bike)
  	test_bike_2 = Bike.new
  	expect {subject.dock(test_bike_2)}.to raise_error("No space to dock here.")
  end

  it {is_expected.to respond_to(:dock).with(1).argument}
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
