require 'airport'

describe 'Airport'  do

	let(:airport){Airport.new}
	let(:plane){Plane.new}

	context 'taking off and landing'

	it'has planes' do
		expect(airport.plane_count).to eq(2)
	end

	it 'a plane can land' do
		expect(airport.plane_count).to eq(2)
		airport.land_plane(plane)
		expect(airport.plane_count).to eq(3)
	end


	it 'a plane can take off' do
	 	airport.clear_for_takeoff(plane)
	 	expect(airport.plane_count).to eq(1)
	end	

	it 'a plane cannot land if the airport is full' do
		airport.land_plane(plane)
		expect(airport.plane_count).to eq(3)
		expect(lambda {airport.land_plane(plane)}).to raise_error(RuntimeError)
	end

	context 'weather conditions' do

	before do

		airport.stub(:weather_sunny?).and_return false
	end

	it 'a plane cannot land if there is a storm ' do
		expect(lambda {airport.land_plane(plane)}).to raise_error(RuntimeError)
	end

	it 'a plane cannot takeoff if there is a storm' do
		expect(lambda {airport.clear_for_takeoff(plane)}).to raise_error(RuntimeError)

	end

	end

end