require 'rails_helper'

describe 'Forecast API' do 
  it 'can get a successful response' do 
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end 

  describe 'happy path' do 
    it 'sends weather data for a specific location' do 
      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to eq(nil)
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq("forecast")
      expect(forecast).to have_key(:attributes)

      expect(forecast[:attributes]).to have_key(:current_weather)
      expect(forecast[:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:attributes][:current_weather][:datetime]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:attributes][:current_weather][:uvi]).to be_a(Float)
      expect(forecast[:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:attributes][:current_weather][:conditions]).to be_a(String)
      expect(forecast[:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)
      
      expect(forecast[:attributes]).to have_key(:daily_weather)
      expect(forecast[:attributes][:daily_weather]).to be_a(Array)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:date)
      expect(forecast[:attributes][:daily_weather][0][:date]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(forecast[:attributes][:daily_weather][0][:sunrise]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(forecast[:attributes][:daily_weather][0][:sunset]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(forecast[:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(forecast[:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:conditions)
      expect(forecast[:attributes][:daily_weather][0][:conditions]).to be_a(String)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:icon)
      expect(forecast[:attributes][:daily_weather][0][:icon]).to be_a(String)
      
      expect(forecast[:attributes]).to have_key(:hourly_weather)
      expect(forecast[:attributes][:hourly_weather]).to be_a(Array)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:time)
      expect(forecast[:attributes][:hourly_weather][0][:time]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(forecast[:attributes][:hourly_weather][0][:temperature]).to be_a(Float)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(forecast[:attributes][:hourly_weather][0][:conditions]).to be_a(String)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:icon)
      expect(forecast[:attributes][:hourly_weather][0][:icon]).to be_a(String)
    end 
  end

  describe 'sad path' do 
    it 'sends weather data for a specific location' do
      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to_not have_key(:lat)
      expect(forecast).to_not have_key(:lon)
      expect(forecast).to_not have_key(:daily)
      expect(forecast).to_not have_key(:hourly)
      expect((forecast[:data][:attributes][:hourly_weather]).length).to_not eq(16)
      expect((forecast[:data][:attributes][:daily_weather]).length).to_not eq(7)

      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:weather)

      expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonrise)
      expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonset)
      expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
      expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)

      expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:humidity)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_deg)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
    end 
  end 
end 