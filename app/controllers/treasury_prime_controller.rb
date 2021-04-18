class TreasuryPrimeController < ApplicationController
  def ping
    @controller_method = "TreasuryPrime#ping"
    service = TreasuryPrime.new
    @uri_string, @response = service.ping
    @body_values = parse_body(@response)
  end

  def accounts
    @controller_method = "TreasuryPrime#accounts"
    service = TreasuryPrime.new
    @uri_string, @response = service.account
    @body_values = parse_body(@response)
    render :ping
  end

  private
  def parse_body(tp_response)
    body_values = {}
    body_values = JSON.parse(tp_response.body) rescue nil
    body_values
  end
end
