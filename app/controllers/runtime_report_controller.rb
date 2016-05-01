require 'time'

class RuntimeReportController < ApplicationController
  def get
    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "#{EcobeeApi::FORMAT_JSON}&body={\"startDate\":\"2016-01-01\",\"endDate\":\"2016-01-02\",\"columns\":\"zoneCalendarEvent\",\"selection\":{\"selectionType\":\"thermostats\",\"selectionMatch\":\"310188254149\"}}"
    url = "#{EcobeeApi::RUNTIME_REPORT_ROOT}?#{query_string}"
    Rails.logger.debug(url)
    begin
      response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        @token_request_response = Token::refresh
        response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}, message is #{error.message}")
      end
    end
    Rails.logger.debug("Response is #{response}")
  end

  def query
    start_datetime = params["start_datetime"]
    end_datetime = params["end_datetime"]

    if start_datetime.empty? || end_datetime.empty?
      render text: "Start datetime or end datetime is missing"
      return
    end

    start_date = DateTime.parse(start_datetime).to_date
    end_date = DateTime.parse(end_datetime).to_date

    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "#{EcobeeApi::FORMAT_JSON}&body={\"startDate\":\"#{start_date}\",\"endDate\":\"#{end_date}\",\"columns\":\"zoneCalendarEvent\",\"selection\":{\"selectionType\":\"thermostats\",\"selectionMatch\":\"310188254149\"}}"
    url = "#{EcobeeApi::RUNTIME_REPORT_ROOT}?#{query_string}"
    Rails.logger.debug(url)
    begin
      response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
    rescue RestClient::InternalServerError => e
      error = EcobeeError.new(JSON.parse(e.response))
      if error.code == ResponseCode.expired_token.code
        @token_request_response = Token::refresh
        response = RestClient.get url, { content_type: EcobeeApi::JSON_CONTENT_TYPE_UTF8, authorization: "#{@token_request_response.token_type} #{@token_request_response.access_token}" }
      else
        Rails.logger.debug("Error code is #{error.code} and Success code is #{ResponseCode.success.code}, message is #{error.message}")
      end
    end
    Rails.logger.debug("Response is #{response}")

    render text: response.to_json
  end
end
