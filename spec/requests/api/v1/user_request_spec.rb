require 'rails_helper'

RSpec.describe 'Create user endpoint' do 
  it 'can create a new user' do
    user_params = ({
                email: 'shirley@me.com',
                password: '123abc',
                password_confirmation: '123abc'
              })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

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