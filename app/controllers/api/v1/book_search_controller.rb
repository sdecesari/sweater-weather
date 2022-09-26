class Api::V1::BookSearchController < ApplicationController
  before_action :set_data

  def index
    # binding.pry
    BooksSerializer.serialize(@data, params[:location])
  end

  
  def set_data
    if params[:quantity].nil? || params[:quantity] == ""
      params[:quantity] = 5
    end

    if params[:location].nil? || params[:location] == ""
      render json: { status: 'ERROR', message: "No location specified", data: {}}, status: :bad_request
    else
      location = MapFacade.create_location(params[:location])
      # binding.pry
      @data = {
        count: BookFacade.new.total_books_found(params[:location], params[:quantity]),
        books: BookFacade.new.make_books(params[:location], params[:quantity]),
        weather: ForecastFacade.new.create_forecast(location.latitude, location.longitude)
      }
    end
  end
end