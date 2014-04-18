class Plane

	def initialize
		@landed = false
		@flying = true
	end

	def landed?
		@landed = true
	end

	def take_off
		@flying = true
	end

	
end
