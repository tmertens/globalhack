module Admin
  class DashboardController < BaseController


    def index
      @organization = current_user.organization
    end


  end
end
