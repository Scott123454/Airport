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
		@planes << plane
	end

	def takeoff(plane)
		@planes.pop
	end

	def full?
		plane_count == CAPACITY
	end

	def capacity
		if full == true
			return "AIRPORT IS FULL"
		end
	end

	def clear_to_land
		if weather_selector == 'stormy'
			return	"CANNOT LAND STORM BREWING"
			# land(plane)
		end
	end

end


	# def initialize(planes = [], options = {})
	# 	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	# 	@planes = planes



