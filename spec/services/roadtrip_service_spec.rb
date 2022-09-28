require 'rails_helper'

RSpec.describe 'Roadtrip Service' do
  it 'returns a connection', :vcr do
      expect(RoadtripService.conn_map).to be_a(Faraday::Connection)
  end

    it 'returns two locations' do 
    get_location = RoadtripService.get_route("Denver, CO", "Estes Park, CO")

    expect(get_location).to be_a(Hash)
    expect(get_location).to have_key(:route)
    expect(get_location[:route]).to be_a(Hash)
    expect(get_location[:route]).to have_key(:formattedTime)
    expect(get_location[:route][:formattedTime]).to be_a(String)
    expect(get_location[:route]).to have_key(:locations)
    expect(get_location[:route][:locations]).to be_a(Array)
  end 
end