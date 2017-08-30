class SearchController < ApplicationController

  def index
    @stations = StationResult.new(params['q']).stations
  end

end
