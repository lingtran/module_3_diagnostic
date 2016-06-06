require 'rails_helper'

RSpec.describe "NREL services" do
  VCR.use_cassette "nrel_alt_fuels" do
    service = NrelServices.new
    zipcode = "80203"
    response = service.get_nearest_stations(zipcode)
  end
end
