class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @client = Client.find_by(id: params['id'])
  end

  def client_params
    params.require(:client).permit(:informal_name)
  end
end
