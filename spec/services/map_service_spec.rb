require 'rails_helper'

RSpec.describe 'MapService' do 
  it 'returns a connection', :vcr do 
    expect(MapService.conn_map).to be_a(Faraday::Connection)
  end 

  it 'returns a location', :vcr do
     get_location = MapService.get_location("Denver, CO")

     expect(get_location).to be_a(Hash)

     expect(get_location).to have_key(:results)
     expect(get_location[:results]).to be_a(Array)
     
     expect(get_location[:results][0]).to have_key(:locations)
     expect(get_location[:results][0][:locations]).to be_a(Array)
     
     expect(get_location[:results][0][:locations][0]).to have_key(:latLng)
     expect(get_location[:results][0][:locations][0]).to be_a(Hash)
     
     expect(get_location[:results][0][:locations][0][:latLng]).to have_key(:lat)
     expect(get_location[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)

     expect(get_location[:results][0][:locations][0][:latLng]).to have_key(:lng)
     expect(get_location[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
  end
end 