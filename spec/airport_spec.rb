require "airport"

describe "airport"  do

	let(:airport){Airport.new}
	let(:airport_with_plane){airport(plane)}
	let(:plane){Plane.new}


	def fill_airport(airport)
		40.times {airport.clear_to_land(plane)}
	end

	context"taking off and landing:" do

		it"land a plane" do
			airport.stub(:weather_selector).and_return('sunny')
			airport.clear_to_land(plane)
			expect(airport.plane_count).to eq(1)
		end

		it"allow plane to take off" do
			airport.stub(:weather_selector).and_return('sunny')
			airport.clear_to_takeoff(plane)
			airport.takeoff(plane)
			expect(airport.plane_count).to eq(0)
		end

	end

	
	context "traffic control" do

		it 'a plane cannot land if the airport is full' do
			airport.stub(:weather_selector).and_return('sunny')
			fill_airport(airport)
			expect(airport.land(plane)).to eq("AIRPORT IS FULL")	
		end
	end


	context "weather conditions" do

		it "a plane cannot take off when there is a storm brewing" do
			airport.stub(:weather_selector).and_return('stormy')
			plane.landed?
			expect(airport.clear_to_takeoff(plane)).to eq("CANNOT TAKEOFF")
		end

		it"plane cannot land in storm" do
			airport.stub(:weather_selector).and_return 'stormy'	
			expect(airport.clear_to_land(plane)).to eq("CANNOT LAND STORM BREWING")
		end	
	end

	context "grand finale all planes can land and takeoff" do

		it "all planes takeoff then land" do
			airport.stub(:weather_selector).and_return('sunny')
			fill_airport(airport)
			expect(airport.plane_count).to eq(40)
			plane.take_off
			40.times {airport.takeoff(plane)}
			expect(airport.plane_count).to eq(0)
			plane.landed?
			40.times {airport.land(plane)}
			expect(airport.plane_count).to eq(40)
		end	

	end

end


