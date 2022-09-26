class ForecastFacade
  def create_forecast(lat, lon)
    json = ForecastService.get_weather(lat, lon)
    current = CurrentForecast.new(json[:current])
    hourly = json[:hourly][0..7].map { |data| HourlyForecast.new(data) }
    daily = json[:daily][0..4].map { |data| DailyForecast.new(data) }
    [current, daily, hourly]
  end
end