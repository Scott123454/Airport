module Weather

	def weather_selector
		random_number = Random.new
		if (random_number.rand(1..5)) == (1 or 2 or 3 or 4)
			weather = 'sunny'
		else (random_number.rand(1..5)) == 5
			weather = 'stormy'
		end
	end
end