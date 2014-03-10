module BikeContainer

	DEFAULT_CAPACITY = 10	

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		#if capacity is reached, raise and exception
		raise "Container is full" if full?
		raise "This is not a bike"unless bike.instance_of?(Bike)
		bikes << bike
	end

	# What if we try to release a bike that's not there? What if we pass an empty argument? What if we pass an argument that is not a bike at all?
	def release(bike)
		raise "I do not hold this bike" unless bikes.include?(bike)
		raise "Item is not a bike" unless bike.instance_of?(Bike) 
		bikes.delete(bike)
	end	

	def full?
		bike_count == @capacity
	end

	def empty?
	 	bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes - available_bikes
	end

end