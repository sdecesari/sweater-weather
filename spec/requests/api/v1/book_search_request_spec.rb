require 'rails_helper'

describe 'Book API' do 
  it 'can get a scuccessful response', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/book-search', headers: headers, params: { location: "denver,co" }
    book = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(book).to have_key(:data)
    expect(book).to be_a Hash
    expect(book).to have_key(:data)
    expect(book[:data]).to have_key(:id)
    expect(book[:data]).to have_key(:type)
    expect(book[:data]).to have_key(:attributes)
    expect(book[:data][:type]).to eq("book")
    expect(book[:data][:attributes]).to have_key(:destination)
    expect(book[:data][:attributes]).to have_key(:book)
    expect(book[:data][:attributes]).to have_key(:total_books_found)
    expect(book[:data][:attributes]).to have_key(:books)
    expect(book[:data][:attributes][:book]).to have_key(:summary)
    expect(book[:data][:attributes][:book]).to have_key(:temperature)
    book[:data][:attributes][:books].each do |book|
      expect(book).to have_key(:isbn)
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
    end
  end
end 