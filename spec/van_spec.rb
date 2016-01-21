require 'van'

describe Van do

    it { is_expected.to respond_to :pickup }

    let(:bike) {double :bike}

    it "checks which bikes are broken at the docking station and takes them away" do
      allow(bike).to receive(:broken).and_return(true)
      bike.report_broken
      expect(subject.pickup).to eq :broken_bikes
    end

end


# iterate through bikes array, check which ones are broken, and shovel them
# into a new array for the van to take away
