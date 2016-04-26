class EcobeeApi
  API_ROOT = "https://api.ecobee.com"
  TOKEN_ROOT = "#{API_ROOT}/token"
  AUTHORIZE_ROOT = "#{API_ROOT}/authorize"
  THERMOSTAT_ROOT = "#{API_ROOT}/1/thermostat"
  THERMOSTAT_SUMMARY_ROOT = "#{API_ROOT}/1/thermostatSummary"
  JSON_CONTENT_TYPE = "application/json"
  UTF8 = "charset=UTF-8"
  JSON_CONTENT_TYPE_UTF8 = "#{JSON_CONTENT_TYPE};#{UTF8}"
  RUNTIME_REPORT_ROOT = "#{API_ROOT}/1/runtimeReport"
  FORMAT_JSON = "format=json"
end