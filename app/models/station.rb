class Station
  attr_reader :name, :address, :fuel_types, :access_times

  def initialize(name, address, fuel_types, access_times)
    @name = name
    @address = address
    @fuel_types = fuel_types
    @access_times = access_times
  end
end
