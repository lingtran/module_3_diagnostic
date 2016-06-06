require 'rails_helper'

RSpec.describe "NREL services" do
  VCR.use_cassette "nrel_alt_fuels" do
    service = NrelServices.new
    zipcode = "80203"
    raw_response = service.get_nearest_stations(zipcode)
    parsed_response = service.parse_nearest_stations(raw_response)
  end
end
