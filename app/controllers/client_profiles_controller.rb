class ClientProfilesController < ApplicationController
  def new
    @client = Client.find_by(id: params['id'])
    @client.client_profile = ClientProfile.new
  end
end
