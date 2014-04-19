require "weather"

class Airport

	include Weather

	CAPACITY = 40

	def initialize(planes=[])
		@planes = planes
	end

	def plane_count
		@planes.count
	end

	def has_planes?
		@planes.any?
	end

	def land(plane)
		if full?
			return "AIRPORT IS FULL"
		end
		@planes << plane
	end

	def takeoff(plane)
		@planes.pop
	end

	def full?
		plane_count == CAPACITY
	end

	def clear_to_land(plane)
		if weather_selector == 'stormy'
			return	"CANNOT LAND STORM BREWING"
		end
		if full?	
			return "AIRPORT IS FULL"
		end
		plane.landed?
		@planes << plane
		
	end


	def clear_to_takeoff(plane)
		if weather_selector == 'stormy'
			return "CANNOT TAKEOFF"
			plane.takeoff(plane)
		end
	end


end


	# def initialize(planes = [], options = {})
	# 	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	# 	@planes = planes



