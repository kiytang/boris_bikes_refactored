require "./lib/docking_station"

describe DockingStation do

	let(:station) { DockingStation.new(:capacity => 30) }

	it "should allow setting default capacity on initialising" do
		expect(station.capacity).to eq(30)
	end	
end
