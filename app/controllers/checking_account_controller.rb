class CheckingAccountController < ApplicationController
  def show
    service = TreasuryPrime.new
    @uri_string, @response = service.checking_account_info(params["id"])
    @account_id = JSON.parse(@response.body)["account_id"]
  end

  def details
    service = TreasuryPrime.new
    @uri_string, @response = service.checking_account_details(params["id"])
    @current_balance = JSON.parse(@response.body)["current_balance"]
  end

end
