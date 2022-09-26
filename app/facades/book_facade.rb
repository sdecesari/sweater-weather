class BookFacade
  def get_books(location, quantity)
    service.get_books(location, quantity)
  end

  def total_books_found(location, quantity)
    get_books(location, quantity)[:numFound]
  end

  def make_books(location, quantity)
    get_books(location, quantity)[:docs]
  end

  private
  def service
    BookService.new
  end
end 