class ThermostatSummaryResponse
  THERMOSTAT_IDENTIFIER = 0
  THERMOSTAT_NAME = 1
  CONNECTED = 2
  THERMOSTAT_REVISION = 3
  ALERTS_REVISION = 4
  RUNTIME_REVISION = 5
  INTERVAL_REVISION = 6

  def initialize(attributes)
    @thermostat_count = attributes["thermostatCount"]
    revision_list = attributes["revisionList"][0].split(':')
    @thermostat_identifier = revision_list[THERMOSTAT_IDENTIFIER]
    @thermostat_name = revision_list[THERMOSTAT_NAME]
    @connected = revision_list[CONNECTED]
    @thermostat_revision = revision_list[THERMOSTAT_REVISION]
    @alerts_revision = revision_list[ALERTS_REVISION]
    @runtime_revision = revision_list[RUNTIME_REVISION]
    @interval_revision = revision_list[INTERVAL_REVISION]
    @status_list = attributes["statusList"]
    @status = attributes["status"]
    Rails.logger.debug(attributes)
  end
end