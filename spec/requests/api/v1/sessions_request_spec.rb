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
  end 
end 