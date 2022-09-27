require 'rails_helper'

RSpec.describe 'Session' do 
  it 'can validate a user' do 
    user = User.create!(email: 'shirley@me.com', password: '123test', password_confirmation: '123test')
    params = ({
      email: 'shirley@me.com',
      password: '123test'
    })
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:type]).to eq("users")
    expect(results[:data]).to have_key(:id)
    expect(results[:data][:id]).to be_a(String)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:email)
    expect(results[:data][:attributes][:email]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:api_key)
  end 
end 