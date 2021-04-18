class TreasuryPrimeController < ApplicationController
  def ping
    service = TreasuryPrime.new
    @uri_string, @response = service.ping
    @body_values = {}
    begin
      puts JSON.parse(@response.body)

      @body_values = JSON.parse(@response.body)
      puts "body values: #{@body_values}"
    rescue nil
    end
  end

  def authed_ping
  end
end
