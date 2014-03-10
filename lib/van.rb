require "bike_container"
require "garage"


class Van
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end  
end