#load BikeContainer
require 'bike_container'

class DockingStation

	#the below gives us all the methods that are contained
	#in BikeCotainer. As it is the same, we remove as hown below:
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

end