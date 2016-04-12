class ThermostatController < ApplicationController
  def hit
    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "json={\"selection\":{\"includeAlerts\":\"true\",\"selectionType\":\"registered\"}}"
    url = "https://api.ecobee.com/1/thermostat?#{query_string}"
    Rails.logger.debug(url)
    begin
      @response = RestClient.get url, { content_type: "application/json;charset=UTF-8", authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        @token_request_response = Token::refresh
        @response = RestClient.get url, { content_type: "application/json;charset=UTF-8", authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}")
      end
    end
  end
end
