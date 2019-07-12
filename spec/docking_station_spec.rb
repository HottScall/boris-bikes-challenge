require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases working bikes that are docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'returns an error when no bike is docked ' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end


  describe "#dock" do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns an error when a dock is full' do
      DockingStation::MAXIMUM_CAPACITY.times do
        subject.dock Bike.new
      end
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end

end
