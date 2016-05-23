class Sensor
  def initialize(sensor_id, sensor_name, sensor_type, sensor_usage)
    @sensor_id = sensor_id.strip
    @sensor_name = sensor_name.strip
    @sensor_type = sensor_type.strip
    @sensor_usage = sensor_usage.strip
  end
end