class RoadtripService
  def self.conn_map
    url = "http://www.mapquestapi.com/directions/v2/route"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.get_route(from, to)
    response = conn_map.get do |faraday|
      faraday.params['from'] = from 
      faraday.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end 