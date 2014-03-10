require "garage"


describe Garage do
  
  let(:bike) {Bike.new}
  let(:garage) {Garage.new(:capacity => 60)}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(60)
  end

  it "should fix broken bikes immediately" do
		bike.break
		garage.dock(bike)
		expect(bike).to_not be_broken
	end
end