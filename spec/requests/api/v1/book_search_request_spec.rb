require 'rails_helper'

describe 'Book API' do 
  location = "denver,co"
  quantity = 5
  it 'can get a scuccessful response' do 
    get "/api/v1/book_search?location=#{location}&quantity=#{quantity}"
    

    expect(response).to be_successful
  end
end 