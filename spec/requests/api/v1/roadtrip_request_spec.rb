require 'rails_helper'

RSpec.describe 'Roadtrip' do 
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

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
  end 
end 