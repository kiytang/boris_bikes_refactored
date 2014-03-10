require "bike_container"
require "garage"


class Van
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end  

  def pick_up_from(site, only_broken=true)
    bikes_to_move = only_broken ? site.broken_bikes : site.available_bikes
    bikes_to_move.each do |bike|
      break if full?
      get_bike_from(bike,site)
    end
  end
  
  def get_bike_from(bike, source)
    source.release(bike)
    self.dock(bike)
  end
end