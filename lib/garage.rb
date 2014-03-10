class Garage
  
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end 

  def dock(bike)
    if bike.broken?
      bike.fix
      super
    end
  end
end