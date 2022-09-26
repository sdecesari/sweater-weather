class ForecastService
  def self.conn_weather
    url = "https://api.openweathermap.org/data/2.5/"
    Faraday.new(url: url) 
  end

  def self.get_weather(lat, lon)
    response = conn_weather.get("onecall?appid=#{ENV['forecast_api_key']}&lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end 