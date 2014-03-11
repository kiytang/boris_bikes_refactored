class Garage
  
  include BikeContainer

  def dock(bike)
    if bike.broken?
      bike.fix
      super
    end

    # bike.fix if bike.broken? 
  end

  def default_capacity
    60
  end
end