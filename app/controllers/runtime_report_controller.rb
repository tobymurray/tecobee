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
    local_start_datetime = params["start_datetime"]
    local_end_datetime = params["end_datetime"]

    if local_start_datetime.empty? || local_end_datetime.empty?
      render text: "Start datetime or end datetime is missing"
      return
    end

    utc_start_datetime = ActiveSupport::TimeZone.new('America/New_York').local_to_utc(DateTime.parse(local_start_datetime))
    utc_end_datetime = ActiveSupport::TimeZone.new('America/New_York').local_to_utc(DateTime.parse(local_end_datetime))

    @token_request_response = TokenRequestResponse.first!
    query_string = URI.encode "#{EcobeeApi::FORMAT_JSON}&body={#{query_object_for_interval(utc_start_datetime, utc_end_datetime)},\"columns\":\"zoneCalendarEvent\",\"includeSensors\":\"true\",\"selection\":{\"selectionType\":\"thermostats\",\"selectionMatch\":\"310188254149\",\"includeRuntime\":\"true\"}}"
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

    Rails.logger.debug(response.to_s)
    render text: response.to_s
  end

  def query_object_for_interval(utc_start_datetime, utc_end_datetime)
    utc_start_date = utc_start_datetime.to_date
    utc_start_interval = datetime_to_interval utc_start_datetime

    utc_end_date = utc_end_datetime.to_date
    utc_end_interval = datetime_to_interval utc_end_datetime

    "\"startDate\":\"#{utc_start_date}\",\"startInterval\":\"#{utc_start_interval}\",\"endDate\":\"#{utc_end_date}\",\"endInterval\":\"#{utc_end_interval}\""
  end

  def datetime_to_interval(datetime)
    num_minutes = (datetime - datetime.at_beginning_of_day) * Utils::MINUTES_PER_DAY
    minutes_to_interval(num_minutes)
  end

  def minutes_to_interval(minutes)
    (minutes/5).to_i
  end
end
