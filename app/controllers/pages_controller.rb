class PagesController < ApplicationController

  def index
    redirect_to admin_path if user_signed_in?
  end

end
