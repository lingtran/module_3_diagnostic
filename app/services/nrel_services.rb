class NrelServices
  def initialize
    @_connection = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/")
  end

  def get_nearest_stations(zipcode)
    connection.get "nearest.json", { api_key: ENV["nrel_api_key"], zip: zipcode, location: zipcode, radius: 6, fuel_type: "ELEC,LPG" }
  end

  def parse_nearest_stations(zipcode)
    parse(get_nearest_stations(zipcode))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def connection
    @_connection
  end
end
