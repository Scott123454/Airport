require "airport"

describe "airport"  do

	let(:airport){Airport.new}
	let(:airport_with_plane){airport(plane)}
	let(:plane){Plane.new}
	before do
	airport.stub(:weather_selector).and_return 'sunny'
	end

	context"taking off and landing" do

		it"land a plane" do
			airport
			expect(airport.plane_count).to eq(0)
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
		end

		it"allow plane to take off" do
			airport.land(plane)
			airport.takeoff(plane)
			expect(airport.plane_count).to eq(0)
		end

	end

	
	context "traffic control" do

		# it 'a plane cannot land if the airport is full' do
		# 	# 40.times airport.land(plane)
		# 	expect(airport.land(plane).capacity).to eq("AIRPORT IS FULL")	
		# end

		it "a plane cannot take off when there is a storm brewing" do

		end

		it"plane cannot land in storm" do
			airport.stub(:weather_selector).and_return 'stormy'	
			expect(airport.clear_to_land).to eq("CANNOT LAND STORM BREWING")
		end	

	end

end


	# it"plane can land if sunny" do
	# 	airport.clear_to_land
	# 	expect(airport.plane_count).to eq(1)
	# end


	# airport.stub(:weather_selector).and_return('stormy')
	# it"plane can land when sunny" do
	# 	airport.stub(:weather_selector).and_return("sunny")
	# 	expect(airport.plane_count).to (1)
	# end 



 # airport.stub(:weather_selector).and_return('stormy')






 # expect{airport.clear_to_land(plane)}.to raise_error(RuntimeError)
	

