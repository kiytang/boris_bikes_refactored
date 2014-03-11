#load BikeContainer
require 'bike_container'

class DockingStation

	include BikeContainer

	def default_capacity
		30
	end
end