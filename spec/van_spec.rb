require 'van'

describe Van do

  describe '#collect_bikes' do
    it {is_expected.to respond_to(:collect_bikes).with(1).argument}

    let(:broken_bike) {double(:bike, :working => false)}
    let(:working_bike) {double(:bike, :working => true)}
    let(:station) {double(:docking_station, :bikes => [broken_bike, working_bike])}

    it 'allows vans to collect broken bikes' do
      subject.collect_bikes(station)
      expect(subject.bikes).to eq [broken_bike]
    end
  end

  describe '#deliver_bikes' do
    it {is_expected.to respond_to(:deliver_bikes).with(1).argument}

    let(:broken_bike1) { double(:bike, :working => false) }
    let(:broken_bike2) { double(:bike, :working => false) }
    let(:station) {double(:docking_station, :bikes => [broken_bike1, broken_bike2])}
    let(:garage) { double(:garage) }


    it 'delivers broken bikes to a garage' do
      allow(garage).to receive(:receive_bikes)
      subject.collect_bikes(station)
      subject.deliver_bikes(garage)
      expect(subject.bikes).to be_empty
    end

  end

  describe '#collect_working_bikes' do
    it {is_expected.to respond_to(:collect_working_bikes).with(1).argument}

    let(:bike1) { double(:bike, :working => true) }
    let(:bike2) { double(:bike, :working => true) }
    let(:garage) { double(:garage, :bikes => [bike1, bike2]) }

    it 'collects working bikes' do
      subject.collect_working_bikes(garage)
      expect(subject.bikes).to eq [bike1, bike2]
    end
  end

  describe '#deliver_working_bikes_to_dock' do
    it {is_expected.to respond_to(:deliver_working_bikes_to_dock).with(1).argument}

    let(:broken_bike1) { double(:bike, :working => false) }
    let(:station) {double(:docking_station, :bikes => [broken_bike1])}
    let(:garage) { double(:garage) }

    it 'will not return broken bikes to a dock' do
      subject.collect_bikes(station)
      expect(subject.deliver_working_bikes_to_dock(garage)).to raise_error("You can't return broken bikes to a dock")
    end

  end

end
