class SearchController < ApplicationController
  def index
    stations = Station.new(zipcode)
  end

  private

  def search_params
    params.permit(:zipcode)
  end
end
