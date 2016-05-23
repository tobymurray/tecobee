class SensorList
  def initialize(thermostat_identifier, sensors, columns, data)
    @thermostat_identifier = thermostat_identifier
    @sensors = sensors.map { |sensor| Sensor.new(sensor["sensorId"], sensor["sensorName"], sensor["sensorType"], sensor["sensorUsage"]) }
    @data_list = DataList.new(columns, data)
  end
end

# @sensor_list=[
#     {
#         "thermostatIdentifier"      =>"310188254149",
#         "sensors"      =>      [
#             {
#                 "sensorId"            =>"ei:0:2            ", "            sensorName"=>"Thermostat Humidity",
#                 "sensorType"            =>"humidity",
#                 "sensorUsage"            =>"indoor"
#             },
#             {
#                 "sensorId"            =>"ei:0:1            ", "            sensorName"=>"Thermostat Temperature",
#                 "sensorType"            =>"temperature",
#                 "sensorUsage"            =>"indoor"
#             },
#             {
#                 "sensorId"            =>"rs:100:1            ", "            sensorName"=>"Basement",
#                 "sensorType"            =>"temperature",
#                 "sensorUsage"            =>"indoor"
#             },
#             {
#                 "sensorId"            =>"rs:101:1            ", "            sensorName"=>"Bedroom",
#                 "sensorType"            =>"temperature",
#                 "sensorUsage"            =>"indoor"
#             },
#             {
#                 "sensorId"            =>"rs:102:1            ", "            sensorName"=>"Porch ",
#                 "sensorType"            =>"temperature",
#                 "sensorUsage"            =>"indoor"
#             },
#             {
#                 "sensorId"            =>"rs:100:2            ", "            sensorName"=>"Basement",
#                 "sensorType"            =>"occupancy",
#                 "sensorUsage"            =>"monitor"
#             },
#             {
#                 "sensorId"            =>"rs:101:2            ", "            sensorName"=>"Bedroom",
#                 "sensorType"            =>"occupancy",
#                 "sensorUsage"            =>"monitor"
#             },
#             {
#                 "sensorId"            =>"rs:102:2            ", "            sensorName"=>"Porch ",
#                 "sensorType"            =>"occupancy",
#                 "sensorUsage"            =>"monitor"
#             },
#             {
#                 "sensorId"            =>"ei:0:3            ", "            sensorName"=>"Thermostat Motion",
#                 "sensorType"            =>"occupancy",
#                 "sensorUsage"            =>"indoor"
#             }
#         ],
#         "columns"      =>      [
#             "date",
#             "time",
#             "ei:0:2",
#             "ei:0:1",
#             "rs:100:1",
#             "rs:101:1",
#             "rs:102:1",
#             "rs:100:2",
#             "rs:101:2",
#             "rs:102:2",
#             "ei:0:3"
#         ],
#         "data"      =>      [
#             "2016-05-22,23:30:00,44,71.2,60,67.7,69.7,0,0,0,0",
#             "2016-05-22,23:35:00,44,71.2,60,67.6,69.7,0,0,0,0",
#             "2016-05-22,23:40:00,45,71.2,60,67.6,69.7,0,0,0,0",
#             "2016-05-22,23:45:00,45,71.1,60,67.6,69.5,0,0,0,0"
#         ]
#     }
# ],