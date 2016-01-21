require "bike"

describe Bike do
	it "gives us a working bike when we ask for a bike" do
	  expect(Bike.new.broken?).to eq nil
	end

  it "lets us report a broken bike" do
		subject.report_broken
		expect(subject).to be_broken
  end

	it "tells us if the bike is broken when we ask" do
    bike = Bike.new
		bike.report_broken
		expect(bike.broken?).to eq true
	end
end
