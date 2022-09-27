class RoadtripFacade
  def self.route(from, to)
    RoadtripService.get_route(from, to)
  end
end