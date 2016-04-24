class Runtime
  RUNTIME_REVISION = "runtimeRev"
  CONNECTED = "connected"
  FIRST_CONNECTED = "firstConnected"
  CONNECT_DATE_TIME = "connectDateTime"
  DISCONNECT_DATE_TIME = "disconnectDateTime"
  LAST_MODIFIED = "lastModified"
  LAST_STATUS_MODIFIED = "lastStatusModified"
  RUNTIME_DATE = "runtimeDate"
  RUNTIME_INTERVAL = "runtimeInterval"
  ACTUAL_TEMPERATURE = "actualTemperature"
  ACTUAL_HUMIDITY = "actualHumidity"
  DESIRED_HEAT = "desiredHeat"
  DESIRED_COOL = "desiredCool"
  DESIRED_HUMIDITY = "desiredHumidity"
  DESIRED_DEHUMIDITY = "desiredDehumidity"
  DESIRED_FAN_MODE = "desiredFanMode"

  def initialize(attributes)
    @runtime_revision = attributes[RUNTIME_REVISION]
    @connected = attributes[CONNECTED]
    @first_connected = attributes[FIRST_CONNECTED]
    @connect_date_time = attributes[CONNECT_DATE_TIME]
    @disconnect_date_time = attributes[DISCONNECT_DATE_TIME]
    @last_modified = attributes[LAST_MODIFIED]
    @last_status_modified = attributes[LAST_STATUS_MODIFIED]
    @runtime_date = attributes[RUNTIME_DATE]
    @runtime_interval = attributes[RUNTIME_INTERVAL]
    @actual_temperature = attributes[ACTUAL_TEMPERATURE]
    @actual_humidity = attributes[ACTUAL_HUMIDITY]
    @desired_heat = attributes[DESIRED_HEAT]
    @desired_cool = attributes[DESIRED_COOL]
    @desired_humidity = attributes[DESIRED_HUMIDITY]
    @desired_dehumidity = attributes[DESIRED_DEHUMIDITY]
    @desired_fan_mode = attributes[DESIRED_FAN_MODE]
  end

  def actual_temperature()
    Utils::fahrenheit_to_celsius(@actual_temperature/10.0)
  end

end