require 'rails_helper'

RSpec.describe 'Forecast Service' do 
  it 'returns a connection', :vcr do 
    expect(ForecastService.conn_weather).to be_a(Faraday::Connection)
  end 

  it 'returns a location', :vcr do
     get_location = ForecastService.get_weather(39.7392, -104.9903)
     expect(get_location).to be_a(Hash)
  end 
end 