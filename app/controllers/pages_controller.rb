class PagesController < ApplicationController

  def index
    redirect_to appropriate_path if user_signed_in?
  end

  private

  def appropriate_path
    first_login? ? new_organization_path : admin_dashboard_path
  end

  def first_login?
    current_user && current_user.sign_in_count == 1
  end
end
