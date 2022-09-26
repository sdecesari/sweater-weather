require 'rails_helper'

describe 'Book API' do 
  it 'can get a scuccessful response' do 
    params = { location: "denver,co", quantity: 5 }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/book_search', headers: headers, params: params

    expect(response).to be_successful
    expect(results).to be_a(Hash)
    expect(results).to have_key(:data)
    expect(results[:data]).to be_a(Hash)
  end
end 