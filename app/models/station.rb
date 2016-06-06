class Station
  def service
    NrelServices.new
  end

  def initialize(zipcode)
    response = service.get_nearest_stations(zipcode)
    @stations = service.parse_nearest_stations(response)
  end
end
