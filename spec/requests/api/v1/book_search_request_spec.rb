require 'rails_helper'

describe 'Book API' do 
  it 'can get a scuccessful response', :vcr do 
  
   get '/api/v1/book-search?location=seattle,wa&quantity=5'

    expect(response).to be_successful
    # binding.pry
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to be_a(Hash)
  end
end 