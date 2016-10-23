module Admin
  class DashboardController < BaseController
    before_action :load_user

    def index
      @organization = current_user.organization
    end

    private

    def load_user
      @user = current_user
    end
  end
end
