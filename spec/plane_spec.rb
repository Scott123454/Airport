require 'plane'

describe 'Plane' do

let(:plane){Plane.new}

it 'can fly' do
	expect(plane.fly!).to eq true
end

it 'can land' do
	expect(plane.land!).to eq false
end

	
end



