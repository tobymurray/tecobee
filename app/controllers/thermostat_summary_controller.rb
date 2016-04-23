class ThermostatSummaryController < ApplicationController
  def get
    token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "json={\"selection\":{\"includeAlerts\":\"true\",\"selectionType\":\"registered\",\"includeEquipmentStatus\":\"true\"}}"
    url = "#{EcobeeApi::THERMOSTAT_SUMMARY_ROOT}?#{query_string}"
    Rails.logger.debug(url)
    begin
      response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{token_request_response.token_type} #{token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        token_request_response = Token::refresh
        @esponse = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{token_request_response.token_type} #{token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}")
      end
    end
    Rails.logger.debug("Response is #{response.to_str}")
    @response = ThermostatSummaryResponse.new(JSON.parse(response.to_str))
  end
end
