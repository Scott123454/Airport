require "plane"

describe "Plane" do

let(:plane){Plane.new}

	it"can land" do
		expect(plane.landed?).to be_true
	end

	it"can take off" do
		expect(plane.take_off).to be_true
	end
	
	# it"can land when sunny"
	# 	weather = 
	# 	expect(plane.landed?).to be_true

	# it"can land then take off"
	# 	plane.landed?
	# 	expect(plane)

end