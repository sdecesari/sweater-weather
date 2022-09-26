require 'rails_helper'

RSpec.describe HourlyForecast do 
  it 'exisits and has attributes' do 
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = HourlyForecast.new(json[:hourly][0])

    expect(forecast).to be_a(HourlyForecast)
    expect(forecast.time).to eq("2022-09-23 14:00:00 -0700")
    expect(forecast.temperature).to eq(81.23)
    expect(forecast.conditions).to eq("clear sky")
    expect(forecast.icon).to eq("01d")
  end 
end