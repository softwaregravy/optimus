class TreasuryPrime

  def ping
    uri = URI::HTTPS.build(
      host: TREASURY_PRIME_ENDPOINT, 
      path: '/ping')
    @uri_string = uri.to_s
    connection = Faraday.new(url: @uri_string) do |conn|
      conn.basic_auth(Rails.application.credentials.treasury_direct_api_key, Rails.application.credentials.treasury_direct_secret_key)
      conn.response :logger
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
      conn.response :logger
    end
    @response = connection.get


    return @uri_string, @response
  end


  def create_application(application)
    uri = URI::HTTPS.build(
      host: TREASURY_PRIME_ENDPOINT, 
      path: '/apply/person_application')
    @uri_string = uri.to_s
    connection = Faraday.new(url: @uri_string) do |conn|
      conn.basic_auth(Rails.application.credentials.treasury_direct_api_key, Rails.application.credentials.treasury_direct_secret_key)
      conn.response :logger
      conn.headers['Content-type'] = 'application/json'
    end
    h = application.attributes.to_h
    h["physical_address"] = {
      "street_line_1" => h["street_line_1"],
      "city" => h["city"],
      "state" => h["state"],
      "postal_code" => h["postal_code"],
    }
    ["id", "street_line_1", "city", "state", "postal_code", "created_at", "updated_at"].each do |k|
      h.delete(k)
    end
    h["date_of_birth"] = application.date_of_birth.to_s("%F")
    puts "what are we trying to post here? #{h}"
    puts "and encoded #{JSON.generate(h)}"
    @response = connection.post do |req|
      req.body = JSON.generate(h)
    end
    puts "and we get back: #{@response.body}"

    return @uri_string, @response
  end

end
