class ProfilesController < ApplicationController

  before do
    params.require(:username)
    params.permit(:secret)
  end

  def show
    if client_profile
      @profile = ClientProfilePresenter.new(client_profile, params[:secret])
    end
  end

  private

  def client_profile
    @client_profile ||= ClientProfile.find_by_username(params[:username])
  end

end
