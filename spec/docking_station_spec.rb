require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :bikes }


  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error if no bikes available' do
      message = "No bikes available at this station!"
      expect{subject.release_bike}.to raise_error(message)
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error if docking station full' do
      20.times { subject.dock(Bike.new) }
      expect{subject.dock(Bike.new)}.to raise_error("Docking station full!")
    end
  end
end
