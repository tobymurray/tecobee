class ThermostatResponse

  attr_reader :page, :thermostat_list, :status

  def initialize(attributes)
    @page = Page.new(attributes["page"])
    @thermostat_list = []
    attributes["thermostatList"].each { |t| @thermostat_list << ThermostatList.new(t) }
    @status = Status.new(attributes["status"])

    Rails.logger.debug(attributes)
  end
end