class Api::V1::BookSearchController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    BooksSerializer.serialize(@data, params[:location])
  end

  private
  def set_data
    location = MapFacade.new.create_location(params[:location])
    @data = {
      count: BookFacade.new.total_books_found(params[:location], params[:quantity]),
      books: BookFacade.new.make_books(params[:location], params[:quantity]),
      weather: ForecastFacade.new.create_forecast(location.latitude, location.longitude)
    }
  end
end