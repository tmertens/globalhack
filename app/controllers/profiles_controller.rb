require 'normalize'

class ProfilesController < ApplicationController

  def show
    params.require(:username)
    params[:secret] ||= ''
    if client_profile
      @profile = ClientProfilePresenter.new(client_profile, Normalize.call(params[:secret]))
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
