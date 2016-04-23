class RevisionList
  THERMOSTAT_IDENTIFIER = 0
  THERMOSTAT_NAME = 1
  CONNECTED = 2
  THERMOSTAT_REVISION = 3
  ALERTS_REVISION = 4
  RUNTIME_REVISION = 5
  INTERVAL_REVISION = 6

  def initialize(attribute_string)
    attributes = attribute_string.split(':')
    @thermostat_identifier = attributes[THERMOSTAT_IDENTIFIER]
    @thermostat_name = attributes[THERMOSTAT_NAME]
    @connected = attributes[CONNECTED]
    @thermostat_revision = attributes[THERMOSTAT_REVISION]
    @alerts_revision = attributes[ALERTS_REVISION]
    @runtime_revision = attributes[RUNTIME_REVISION]
    @interval_revision = attributes[INTERVAL_REVISION]
  end
end