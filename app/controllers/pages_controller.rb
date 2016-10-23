class PagesController < ApplicationController

  def index
    redirect_to appropriate_path if user_signed_in?
  end

  private

  def appropriate_path
    needs_organization? ? new_admin_organization_path : '/admin'
  end

  def needs_organization?
    current_user.needs_organization?
  end
end
