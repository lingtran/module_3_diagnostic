require 'rails_helper'

RSpec.describe "NREL services" do
  VCR.use_cassette "nrel_alt_fuels" do
    service = NrelServices.new

  end
end
