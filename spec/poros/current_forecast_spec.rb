require 'rails_helper'

RSpec.describe CurrentForecast do 
  it 'exisits and has attributes' do 
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = CurrentForecast.new(json[:current])

    expect(forecast).to be_a(CurrentForecast)
    expect(forecast.datetime).to eq("2022-09-23 14:33:27 -0700")
    expect(forecast.sunrise).to eq("2022-09-23 05:48:31 -0700")
    expect(forecast.sunset).to eq("2022-09-23 17:56:04 -0700")
    expect(forecast.temperature).to eq(80.74)
    expect(forecast.feels_like).to eq(78.94)
    expect(forecast.humidity).to eq(18)
    expect(forecast.uvi).to eq(2.9)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.conditions).to eq("clear sky")
    expect(forecast.icon).to eq("01d")
  end 
end