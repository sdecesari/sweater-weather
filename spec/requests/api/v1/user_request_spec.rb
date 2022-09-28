require 'rails_helper'

RSpec.describe 'Create user endpoint' do 
  describe 'happy path' do 
    it 'can create a new user' do
      params = ({
        email: 'shirley@me.com',
        password: '123abc',
        password_confirmation: '123abc'
        })
        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(params)

        expect(response).to be_successful
        expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq("users")
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
    end 
  end

  describe 'sad path' do 
    it 'returns error when incorrect password' do 
      params = ({
        email: 'shirley@me.com',
        password: '123abc',
        password_confirmation: '123test'
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(404)
    end 

    it 'will not create user without email' do 
      params = ({
        email: '',
        password: '123abc',
        password_confirmation: '123test'
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(404)
    end

    it 'will not create user if already exisits' do 
      user = User.create!({
        email: "shirley@me.com",
        password: "123test",
        password_confirmation: "123test"
        })
      params = ({
        email: "shirley@me.com",
        password: "123abc",
        password_confirmation: "123abc"
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(404)
    end 
  end 
end 