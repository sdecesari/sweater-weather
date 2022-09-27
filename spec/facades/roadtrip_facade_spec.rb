require 'rails_helper'

RSpec.describe RoadtripFacade do 
  it "returns a roadtrip poro", :vcr do 
    from = 'denver,co'
    to = 'estes park, co'
    roadtrip = RoadtripFacade.route(from, to)

    expect(roadtrip).to be_a(Hash)
    expect(roadtrip).to have_key(:route)
    expect(roadtrip[:route]).to have_key(:formattedTime)
    expect(roadtrip[:route]).to have_key(:locations)
  end 
end 