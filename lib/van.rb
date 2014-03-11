require "bike_container"
require "garage"


class Van
  
  include BikeContainer

  def default_capacity
    15
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
    dock(bike)
  end

  def take_bikes_to(destination)
    bikes.each do |bike|
      move_bike_to(bike, destination)   
    end
  end

  private

  def move_bike_to(bike, destination)
    release(bike)
    destination.dock(bike)
  end

end