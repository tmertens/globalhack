class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      @client.client_profile = ClientProfile.create!(client_id: @client.id, username: Normalize.call(@client.informal_name))
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
    @client.client_profile.bio = params['client']['client_profile_attributes']['bio']

    unless params['client']['avatar'].nil?
      @client.client_profile.update_attributes(avatar: params['client']['avatar'])
    end


    if @client.save
      redirect_to @client
    else
      render 'edit'
    end
  end

  def client_params
    params.require(:client).permit(:informal_name, :avatar)
  end

end
