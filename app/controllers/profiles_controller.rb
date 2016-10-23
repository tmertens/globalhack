require 'normalize'

class ProfilesController < ApplicationController

  def new
    @client_profile = ClientProfile.new
  end

  def show
    params.require(:username)
    params[:secret] ||= ''
    if client_profile
      @profile      = ClientProfilePresenter.new(client_profile, Normalize.call(params[:secret]))
      @client       = client_profile.client
      @client_token = OurBraintree::GenerateClientToken.call
      possible_payment = PossiblePayment.create!(
        client_id: client_profile.client_id,
        client_token: @client_token
      )
      @digested_token = possible_payment.digested_token
    else
      not_found
    end
  end

  private

  def client_profile
    @client_profile ||= ClientProfile.find_by_username(username)
  end

  def username
    Normalize.call(params[:username])
  end

end
