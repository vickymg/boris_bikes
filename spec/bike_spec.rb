require 'bike'

describe Bike do

  describe '#initialize' do
    it "has a default state of working" do
      expect((Bike.new).working).to be_truthy
    end
  end

  describe '#broken' do
    it "can be broken" do
      expect(((Bike.new).broken).working).to be_falsey
    end
  end

end
