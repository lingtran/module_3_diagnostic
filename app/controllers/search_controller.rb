class SearchController < ApplicationController
  def index
    @stations = Station.new(search_params[:zipcode])
  end

  private

  def search_params
    params.permit(:zipcode)
  end
end
