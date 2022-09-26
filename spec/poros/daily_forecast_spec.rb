require 'rails_helper'

RSpec.describe DailyForecast do 
  it 'exisits and has attributes' do 
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
    forecast = DailyForecast.new(json[:daily][0])

    expect(forecast).to be_a(DailyForecast)
    expect(forecast.date).to eq("2022-09-23 11:00:00 -0700")
    expect(forecast.sunrise).to eq("2022-09-23 05:48:31 -0700")
    expect(forecast.sunset).to eq("2022-09-23 17:56:04 -0700")
    expect(forecast.max_temp).to eq(81.23)
    expect(forecast.min_temp).to eq(58.73)
    expect(forecast.conditions).to eq("clear sky")
    expect(forecast.icon).to eq("01d")
  end 
end