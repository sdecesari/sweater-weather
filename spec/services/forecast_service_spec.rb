require 'rails_helper'

RSpec.describe 'Forecast Service' do 
  it 'returns a connection', :vcr do 
    expect(ForecastService.conn_weather).to be_a(Faraday::Connection)
  end 

  it 'returns a location', :vcr do
    get_location = ForecastService.get_weather(39.7392, -104.9903)

    expect(get_location).to be_a(Hash)
    expect(get_location).to have_key(:current)
    expect(get_location[:current]).to have_key(:dt)
    expect(get_location[:current]).to have_key(:sunrise)
    expect(get_location[:current]).to have_key(:sunset)
    expect(get_location[:current]).to have_key(:temp)
    expect(get_location[:current]).to have_key(:feels_like)
    expect(get_location[:current]).to have_key(:humidity)
    expect(get_location[:current]).to have_key(:uvi)
    expect(get_location[:current]).to have_key(:visibility)
    expect(get_location[:current]).to have_key(:weather)
    expect(get_location[:current][:weather][0]).to have_key(:description)
    expect(get_location[:current][:weather][0]).to have_key(:icon)

    expect(get_location).to_not have_key(:minutely)
    expect(get_location).to_not have_key(:alerts)

    get_location[:daily].each do |daily|
      expect(daily).to have_key(:dt)
      expect(daily[:dt]).to be_a(Integer)

      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_a(Integer)

      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_a(Integer)

      expect(daily).to have_key(:temp)
      expect(daily[:temp]).to be_a(Hash)

      expect(daily[:temp]).to have_key(:min)
      expect(daily[:temp][:min]).to be_a(Float)
      
      expect(daily[:temp]).to have_key(:max)
      expect(daily[:temp][:max]).to be_a(Float)
      
      expect(daily[:weather][0]).to have_key(:description)
      expect(daily[:weather][0][:description]).to be_a(String)
      
      expect(daily[:weather][0]).to have_key(:icon)
      expect(daily[:weather][0][:icon]).to be_a(String)
    end 
  end 
end 