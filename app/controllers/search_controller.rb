class SearchController < ApplicationController

  def index
    @stations = StationResult.new(params['q']).stations_creation
  end

end
