class TreasuryPrime

  def ping
    uri = URI::HTTPS.build(
      host: TREASURY_PRIME_ENDPOINT, 
      path: '/ping')
    @uri_string = uri.to_s
    connection = Faraday.new(url: @uri_string) do |conn|
      conn.basic_auth(Rails.application.credentials.treasury_direct_api_key, Rails.application.credentials.treasury_direct_secret_key)
    end
    @response = connection.get


    return @uri_string, @response
  end

  def account
    uri = URI::HTTPS.build(
      host: TREASURY_PRIME_ENDPOINT, 
      path: '/account')
    @uri_string = uri.to_s
    connection = Faraday.new(url: @uri_string) do |conn|
      conn.basic_auth(Rails.application.credentials.treasury_direct_api_key, Rails.application.credentials.treasury_direct_secret_key)
    end
    @response = connection.get


    return @uri_string, @response
  end

end
