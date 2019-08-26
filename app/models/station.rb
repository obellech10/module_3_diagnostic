class Station
  attr_reader :name,
              :address,
              :fueltypes,
              :distance,
              :accesstimes

  def initialize(attributes = {})
    @name     = attributes[:station_name]
    @address = attributes[:street_address]
    @fueltypes = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @accesstimes = attributes[:access_days_time]
  end
end
