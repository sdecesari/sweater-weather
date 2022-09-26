require 'rails_helper'

RSpec.describe Forecast do 
  it 'exisits and has attributes' do 
    response = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(response, symbolize_names: true)
         
    current = CurrentForecast.new(json[:current])
    hourly = json[:hourly][0..7].map { |data| HourlyForecast.new(data) }
    daily = json[:daily][0..4].map { |data| DailyForecast.new(data) }
    forecast = Forecast.new(current, hourly, daily)

    expect(forecast).to be_a Forecast

    expect(forecast.current_forecast).to be_a(CurrentForecast)

    expect(forecast.daily_forecast.first).to be_a(DailyForecast)
    expect(forecast.daily_forecast).to be_a(Array)
    expect(forecast.daily_forecast.count).to eq(5)

    expect(forecast.hourly_forecast.first).to be_a(HourlyForecast)
    expect(forecast.hourly_forecast).to be_a(Array)
    expect(forecast.hourly_forecast.count).to eq(8)
  end 
end