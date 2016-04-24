class ThermostatController < ApplicationController
  def get
    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "json={\"selection\":{\"includeAlerts\":\"true\",\"selectionType\":\"registered\",#{UtilityRestriction::INCLUDE_RUNTIME}:\"true\"}}"
    url = "#{EcobeeApi::THERMOSTAT_ROOT}?#{query_string}"
    Rails.logger.debug(url)
    begin
      response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        @token_request_response = Token::refresh
        response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}")
      end
    end
    @response = ThermostatResponse.new(JSON.parse(response.to_str))
  end

  def temperature
    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "json={\"selection\":{\"includeAlerts\":\"true\",\"selectionType\":\"registered\",#{UtilityRestriction::INCLUDE_RUNTIME}:\"true\"}}"
    url = "#{EcobeeApi::THERMOSTAT_ROOT}?#{query_string}"
    Rails.logger.debug(url)
    begin
      response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        @token_request_response = Token::refresh
        response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}")
      end
    end
    @response = ThermostatResponse.new(JSON.parse(response.to_str))
  end
end
