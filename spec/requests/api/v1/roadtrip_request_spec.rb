require 'rails_helper'

RSpec.describe 'Roadtrip' do 
  describe 'happy path' do 
    it 'can send roadtrip info' do 
      user = User.create!(email: 'shirley@me.com', password: '123test', password_confirmation: '123test')
      params = ({
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: user.api_key
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/roadtrip", headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(results).to have_key(:id)
      expect(results).to have_key(:type)
      expect(results[:type]).to be_a(String)
      expect(results).to have_key(:attributes)
      expect(results[:attributes]).to be_a(Hash)
      expect(results[:attributes]).to have_key(:start_city)
      expect(results[:attributes][:start_city]).to be_a(String)
      expect(results[:attributes]).to have_key(:end_city)
      expect(results[:attributes][:end_city]).to be_a(String)
      expect(results[:attributes]).to have_key(:travel_time)
      expect(results[:attributes][:travel_time]).to be_a(String)
      expect(results[:attributes]).to have_key(:weather_at_eta)
      expect(results[:attributes][:weather_at_eta]).to be_a(Hash)
      expect(results[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(results[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(results[:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(results[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end 
  end 

  describe 'sad path' do 
    it 'returns json response for incorrect API key' do
      user = User.create!(email: 'shirley@me.com', password: '123test', password_confirmation: '123test')
      user.update_attribute(:api_key, 'testapikey')
      params = ({
        origin: "Denver,CO",
        destination: "Estes Park,CO",
        api_key: ""
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/roadtrip", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(401)
    end
  end
end 