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
          "forecast": 
          {
            "summary": data[:weather][0].conditions,
            "temperature": data[:weather][0].temperature
          },
          "total_books_found": data[:count],
          "books": data[:books].map do |book|
            {
              isbn: book[:isbn],
              title: book[:title],
              publisher: book[:publisher]
            }
          end
        }
      }
    }
  end
end