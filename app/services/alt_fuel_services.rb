class AltFuelServices
  def alt_fuel_stations(postal_code)
    key = ENV['ALT_FUEL_API_KEY']
    get_json('/docs/transportation/alt-fuel-stations-v1/nearest.json?api_key=key&location=postal_code&fuel_type=ELEC,LPG&limit=10')
  end


private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["api_key"] = ENV['ALT_FUEL_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
