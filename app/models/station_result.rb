class StationResult

  def initialize(zip)
    @zip = zip
    @nrel = NrelService.new(zip)
  end

  def stations
    binding.pry
    stations_search.each do |station|
      binding.pry
    end
  end

  def stations_search
    @nrel.locate_stations
  end

  private
    attr_reader :zip
end
