class ThermostatSummaryResponse
  def initialize(attributes)
    @thermostat_count = attributes["thermostatCount"]
    @revision_list = attributes["revisionList"].map do |revision_list|
      RevisionList.new(revision_list)
    end
    @status_list = attributes["statusList"]
    @status = attributes["status"]
    Rails.logger.debug(attributes)
  end
end