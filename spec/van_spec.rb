require 'van'

describe Van do

  describe '#collect_bikes' do
    it {is_expected.to respond_to(:collect_bikes).with(1).argument}

    let(:broken_bike) {double(:bike, :working => false)}
    let(:working_bike) {double(:bike, :working => true)}
    let(:station) {double(:docking_station, :bikes => [broken_bike, working_bike])}

    it 'allows vans to collect bikes' do
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

end
