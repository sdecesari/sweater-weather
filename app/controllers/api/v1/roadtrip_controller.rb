class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    roadtrip = RoadtripFacade.route(params[:origin], params[:destination])
    lat_lng = roadtrip[:route][:locations][1][:latLng]
    forecast = ForecastFacade.create_forecast(lat_lng[:lat], lat_lng[:lng])
    if user
      render json: RoadtripSerializer.roadtrip(roadtrip, forecast), status: 200
    else
      render status: 401
    end 
  end 
end 