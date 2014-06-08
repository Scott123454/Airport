require "weather"

class Airport

include Weather

Capacity = 3

self.weather_sunny?

def initialize
	@planes = [Plane.new, Plane.new]
end

def land_plane(plane)
	if weather_sunny? == false 
		raise "Stormy cannot land"
	elsif full 
	 	raise "Airport is full" 
	else 
		plane.land!
		@planes << plane	
	end
end

def plane_count
	@planes.count
end

def clear_for_takeoff(plane)
	if weather_sunny? == false
		raise "Stormy cannot takeoff"
	else
	@planes.pop
	plane.fly!
	end
end

def full
	plane_count == Capacity
end


end