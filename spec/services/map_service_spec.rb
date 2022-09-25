require 'rails_helper'

RSpec.describe 'MapService' do 
  it 'returns a connection', :vcr do 
    expect(MapService.conn_map).to be_a(Faraday::Connection)
  end 

  it 'returns a location', :vcr do
     get_location = MapService.get_location("Denver, CO")
     expect(get_location).to be_a(Hash)
  end
end 