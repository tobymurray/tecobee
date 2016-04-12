class TokenController < ApplicationController
  def request_authoirzation_code
    response = RestClient.get "#{EcobeeApi::AUTHORIZE_ROOT}?response_type=ecobeePin&client_id=#{params[:api_key]}&scope=smartWrite"
    parameters = JSON.parse(response.to_str)
    parameters[:ecobee_pin] = parameters.delete "ecobeePin"
    parameters[:api_key] = params[:api_key]
    AuthorizeResponse.delete_all
    @authorize_response = AuthorizeResponse.new(parameters.symbolize_keys!())
    @authorize_response.save!
  end

  def request_token
    @authorize_response = AuthorizeResponse.first!
    response = RestClient.post EcobeeApi::TOKEN_ROOT, { code: @authorize_response.code, client_id: @authorize_response.api_key, grant_type: 'ecobeePin' }
    @token_request_response = TokenRequestResponse.new(JSON.parse(response.to_str).symbolize_keys!())
    @token_request_response.save!
  end
end
