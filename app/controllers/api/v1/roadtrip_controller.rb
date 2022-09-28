class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    roadtrip = RoadtripFacade.route(params[:origin], params[:destination])
    if roadtrip[:route][:routeError][:errorCode] == 2
      render json: RoadtripSerializer.impossible_route(params[:origin], params[:destination])
    elsif user.blank? == false
    lat_lng = roadtrip[:route][:locations][1][:latLng]
    forecast = ForecastFacade.create_forecast(lat_lng[:lat], lat_lng[:lng])
      render json: RoadtripSerializer.roadtrip(roadtrip, forecast), status: 200
    else
      render status: 401
    end 
  end
end