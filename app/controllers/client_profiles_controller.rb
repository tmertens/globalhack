class ClientProfilesController < ApplicationController
  def new
    @client_profile = ClientProfile.new
  end
end
