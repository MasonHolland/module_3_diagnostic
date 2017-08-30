class NrelService
  def initialize(zip)
    @key = ENV['nrel_api_key']
    @conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1.json')
    @zip = zip
  end

  def locate_stations
    response = conn.get do |req|
      req.params['limit'] = 10
      req.params['location'] = zip
      req.params['radius'] = 6
      req.params['fuel_type'] = 'ELEC,LPG'
      req.params['api_key'] = key
    end
    parse_it(response.body)
  end

  private
    attr_reader :key, :conn, :zip

    def parse_it(json)
      JSON.parse(json)
    end
end
