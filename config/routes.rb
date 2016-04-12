Rails.application.routes.draw do
  get 'test/hit', to: 'test#hit'
  get 'dashboard', to: 'dashboard#index'

  post 'token/request_authoirzation_code', to: 'token_controller#request_authoirzation_code'
  get 'request_token/request_token', to: 'token_controller#request_token'
  get 'token/refresh', to: 'token_controller#refresh'

  get 'thermostat/hit', to: 'thermostat#hit'
end
