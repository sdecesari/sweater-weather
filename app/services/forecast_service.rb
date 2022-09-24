class ForecastService 
  def self.conn_weather
    url = "https://api.openweathermap.org/data/2.5/"
    Faraday.new(url: url) do |faraday|
      faraday.params['appid'] = ENV['forecast_api_key']
    end
  end

  def self.get_weather(lat, lon)
    response = conn_weather.get do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = lon
      faraday.params['exclude'] = "minutely"
      faraday.params['units'] = "imperial"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end 