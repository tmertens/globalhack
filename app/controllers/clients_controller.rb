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
    @client.client_profile.avatar = params['avatar']
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