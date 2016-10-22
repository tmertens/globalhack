class MapsController < ApplicationController

  def show
    @address = Address.first
  end

end
