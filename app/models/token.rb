class Token

  def self.refresh
    token_request_response = TokenRequestResponse.first!
    authorize_response = AuthorizeResponse.first!

    response = RestClient.post "#{EcobeeApi::TOKEN_ROOT}", { grant_type: "refresh_token", refresh_token: token_request_response.refresh_token, client_id: authorize_response.api_key }

    token_request_response.update_attributes(JSON.parse(response.to_str).symbolize_keys!())
    token_request_response.save!
    token_request_response
  end
end