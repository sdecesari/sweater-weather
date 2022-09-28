class RoadtripSerializer 
  def self.roadtrip(roadtrip, forecast)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          "start_city": roadtrip[:route][:locations][0][:adminArea5],
          "end_city": roadtrip[:route][:locations][1][:adminArea5],
          "travel_time": roadtrip[:route][:formattedTime],
          "weather_at_eta": {
            "temperature": forecast[0].temperature,
            "conditions": forecast[0].conditions
          }
        }
      }
    }
  end

  def self.impossible_route(origin, destination)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          "start_city": "{origin}",
          "end_city": "{destination}",
          "travel_time": "Impossible Route",
          "weather_at_eta": {
          }
        }
      }
    }
  end 
end