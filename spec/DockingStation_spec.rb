require 'DockingStation'

describe DockingStation do
	subject(:DockingStation) {described_class.new}

  	it { is_expected.to respond_to :release_bike }

		describe '#release_bike' do
			it 'releases a bike' do
				bike = Bike.new
				subject.dock(bike)
	  		expect(subject.release_bike).to eq bike
	  	end
		end

		describe '#release_bike' do
			it 'expects release_bike to raise an error' do
	  		expect{subject.release_bike}.to raise_error("There are no bikes in the dock")
	  	end
		end

    describe '#dock' do
    	it 'returns docked bikes' do
    		bike = Bike.new
    		subject.dock(bike)
    		expect(subject.bikes).to include bike
    	end
    end

    describe '#dock' do
      it 'expects dock to raise an error' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
        expect{subject.dock(Bike.new)}.to raise_error("The dock is full")
      end
    end

  	it { is_expected.to respond_to(:dock).with(1).argument }


end
