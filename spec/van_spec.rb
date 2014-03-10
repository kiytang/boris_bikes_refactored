require "van"
require "bike"
require "bike_container"
require "garage"

# Design the methods that the van needs to have to move 
# broken bikes from a station to the garage and back 
# (once they are fixed). Implement them.

describe Van do
  
  let(:bike) {Bike.new}
  let(:holder) {Containerholder.new}
  let(:station) {DockingStation.new}
  let (:van) {Van.new(:capacity => 15)}

  it "should allow setting default capicity on initialising" do
    expect(van.capacity).to eq 15    
  end

end