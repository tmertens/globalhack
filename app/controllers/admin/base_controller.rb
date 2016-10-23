module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :load_user

    layout 'admin_dashboard'

    def load_user
      @user ||= current_user
    end

    def organization
      @organization ||= current_user.organization
    end

    def needs_organization?
      current_user.needs_organization?
    end
end
end
