module Admin
  class DashboardController < BaseController
    before_action :redirect_if_no_org
    def redirect_if_no_org
      return redirect_to new_admin_organization_path if current_user.needs_organization?
    end

    def index
      @organization = current_user.organization
    end


  end
end
