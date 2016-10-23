module Admin
  class OrganizationsController < BaseController
    before_action :load_user

    # def index
    # end

    def new
    end

    private

    def load_user
      @user = current_user
    end
  end
end
