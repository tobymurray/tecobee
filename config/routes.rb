Rails.application.routes.draw do
  get 'test/hit', to: 'test#hit'
  get 'dashboard', to: 'dashboard#index'

  post 'token/request_authoirzation_code', to: 'token_controller#request_authoirzation_code'
  get 'request_token/request_token', to: 'token_controller#request_token'
  get 'token/refresh', to: 'token_controller#refresh'

  get 'thermostat', to: 'thermostat#get'
  get 'thermostat/temperature', to: 'thermostat#temperature'
  get 'thermostat_summary', to: 'thermostat_summary#get'

  get 'runtime_report', to: 'runtime_report#get'
end
