class AltFuelStationsFacade
  def initialize(postal_code)
    @postal_code = postal_code
    @service = AltFuelServices.new
  end

  def stations
    @service.alt_fuel_stations(@postal_code).map do |station|
      Station.new
    end
  end
end
