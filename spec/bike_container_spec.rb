require "bike_container"
require "bike"
require "van"
require "garage"
require "docking_station"

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }
	let(:station) {DockingStation.new}
	let(:van) {Van.new}

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end
	
	it "should accept a bike" do
		#we expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		#let's dock a bike into the holder
		holder.dock(bike)
		#now we expect the holder to have 1 bike
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should not release a bike which is not there" do
		expect{holder.release(bike)}.to raise_error
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end

	it "should know when it is empty" do
		expect(holder).to be_empty
		holder.dock(bike)
		expect(holder).not_to be_empty
		
	end

	it "should not accept a bike if it is full" do
		fill_holder holder
		expect{ holder.dock(bike) }.to raise_error(RuntimeError)
	end

	it "should provide a list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])	
	end

	# it "should only pick up broken bikes from station" do
 #    working_bike, broken_bike = Bike.new, Bike.new
 #    broken_bike.break
 #    station.dock(working_bike)
 #    station.dock(broken_bike)
 #    expect {van.pick_up_from(station)}.to change {van.bike_count}.by 1
 #    expect(van.bikes).to eq ([broken_bike])
 #  end
end
