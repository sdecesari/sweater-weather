class BooksSerializer
  def self.serialize(data, location)
    data = {
      "data": 
      {
        "id": nil,
        "type": "books",
        "attributes": 
        {
          "destination": "#{location}",
          # "forecast": 
          # {
          #   "summary": forecast[:current][:weather][0][:description],
          #   "temperature": forecast[:current][:temp]
          # },
          "total_books_found": data[:count],
          # "books": data[:books].shift(quantity).map do |book|
          #   {
          #     "isbn": book[:isbn],
          #     "title": book[:title],
          #     "publisher": book[:publisher]
          #   }
          # end
        }
      }
    }
  end
end