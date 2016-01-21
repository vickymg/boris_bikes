require 'van'

describe Van do

  it {is_expected.to respond_to(:collect_bikes).with(1).argument}

  let(:broken_bike) {double(:bike, :working => false)}
  let(:working_bike) {double(:bike, :working => true)}
  let(:station) {double(:docking_station, :bikes => [broken_bike, working_bike])}
  it 'allows vans to collect bikes' do
    expect(subject.collect_bikes(station)).to eq [broken_bike]
  end

end
