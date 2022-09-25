class MapService 
  def self.conn_map
    url = "http://www.mapquestapi.com/geocoding/v1/address?"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end 
  end

  def self.get_location(location)
    response = conn_map.get do |faraday|
      faraday.params['location'] = location    
    end 
    JSON.parse(response.body, symbolize_names: true)
  end
end 