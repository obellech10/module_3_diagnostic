class AltFuelService
  def alt_fuel_stations(postal_code)
    binding.pry
    get_json()
  end


private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest.json') do |faraday|
      faraday.headers["api_key"] = ENV['ALT_FUEL_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
