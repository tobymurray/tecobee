class ThermostatList
  RUNTIME = "runtime"

  attr_reader :runtime

  def initialize(attributes)
    @identifier = attributes["identifier"]
    @name = attributes["name"]
    @thermostat_revision = attributes["thermostatRev"]
    @is_registered = attributes["isRegistered"]
    @model_number = attributes["modelNumber"]
    @brand = attributes["brand"]
    @features = attributes["features"]
    @last_modified = attributes["lastModified"]
    @thermostat_time = attributes["thermostatTime"]
    @utc_time = attributes["utcTime"]
    @alerts = attributes["alerts"]
    @runtime = Runtime.new(attributes[RUNTIME])
  end
end