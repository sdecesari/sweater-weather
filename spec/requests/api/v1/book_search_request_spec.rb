require 'rails_helper'

describe 'Book API' do 
  it 'can get a scuccessful response' do 
    params = { location: "denver,co", quantity: 5 }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/book_search', headers: headers, params: params

    expect(response).to be_successful
    # expect(response.status).to eq(200)
  end
end 