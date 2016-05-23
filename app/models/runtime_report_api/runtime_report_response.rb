class RuntimeReportResponse
  def initialize(attributes)
    @report_list = attributes["reportList"]
    sensor_list = attributes["sensorList"].first
    Rails.logger.debug(sensor_list)
    @sensor_list = SensorList.new(sensor_list["thermostatIdentifier"], sensor_list["sensors"], sensor_list["columns"], sensor_list["data"])
    @columns = attributes["columns"]
    @timespan = Timespan.new(attributes["startDate"], attributes["startInterval"],
                             attributes["endDate"], attributes["endInterval"])
    @status = Status.new(attributes["status"])
  end
end