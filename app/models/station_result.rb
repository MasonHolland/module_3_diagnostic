class StationResult

  def initialize(zip)
    @zip = zip
    @nrel = NrelService.new(zip)
  end

  def stations_creation
    stations = stations_search["fuel_stations"].map do |station|
      Station.new(station["station_name"],
                  "#{station["street_address"]}, #{station["city"]}, #{station["state"]}, #{station["zip"]}",
                  station["fuel_type_code"],
                  station["access_days_time"]
                  )
    end
    stations
  end

  def stations_search
    @nrel.locate_stations
  end

  private
    attr_reader :zip
end
