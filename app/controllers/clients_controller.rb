class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      @client.client_profile = ClientProfile.create!(client_id: @client.id, username: @client.informal_name)
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @client = Client.find_by(id: params['id'])
  end

  def update
    @client = Client.find_by(id: params['id'])
    @client.informal_name = params['client']['informal_name']

    # this is beating me...
    # the only other idea I have right now is to try to move this to its own controller
    # ClientProfilesController. The reason I say that is because I don't know what else to try
    # and the examples of this are very simple. This should be simple. Crap.

    if @client.client_profile.update_attributes(avatar: params['client']['avatar']) && @client.save
      redirect_to @client
    else
      render 'edit'
    end
  end

  def client_params
    params.require(:client).permit(:informal_name, :avatar)
  end

end
