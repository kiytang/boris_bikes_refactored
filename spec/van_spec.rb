require "van"
require "bike"
require "bike_container"
require "garage"

# Design the methods that the van needs to have to move 
# broken bikes from a station to the garage and back 
# (once they are fixed). Implement them.

class ContainerHolder; include BikeContainer; end

describe Van do
  
  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new}
  let(:station) {DockingStation.new}
  let(:van) {Van.new(:capacity => 15)}
  let(:garage) {Garage.new}

  def fill_van(van)
    van.capacity.times { van.dock(Bike.new) }
  end

  it "should allow setting default capicity on initialising" do
    expect(van.capacity).to eq 15    
  end

  it "should only pick up broken bikes from station" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect {van.pick_up_from(station)}.to change {van.bike_count}.by 1
    expect(van.bikes).to eq ([broken_bike])
  end

  it "should not pick up more bikes once max. capacity reached" do
    fill_van van
    expect{ van.dock(bike)}.to raise_error(RuntimeError) 
  end

  it "should transfer broken bikes to garage" do
    broken_bike = Bike.new
    broken_bike.break
    van.dock(broken_bike)
    expect{van.take_bikes_to(garage)}.to change {van.bike_count}.by -1  
  end

  it "should transfer fixed bikes to docking station" do
    broken_bike = Bike.new
    broken_bike.break
    garage.dock(broken_bike)
    expect{van.pick_up_from(garage, false)}.to change {garage.bike_count}.by -1
  end
end



