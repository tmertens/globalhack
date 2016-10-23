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

    # This does not work correctly
    # here is an issue on this: https://github.com/thoughtbot/paperclip/issues/2151
    # here is prob a good source: http://sparksolutions.co/2016/01/configuring-heroku-aws-s3-and-paperclip-to-work-with-a-bucket-outside-of-the-usa/
    @client.client_profile.avatar = params['client']['avatar']
    @client.client_profile.avatar.save

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
