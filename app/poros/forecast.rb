class Forecast
  attr_reader :id,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(current, hourly, daily)
    @id = nil
    @current_forecast = current
    @hourly_forecast = hourly
    @daily_forecast = daily
  end 
end 