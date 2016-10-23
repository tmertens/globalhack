class PagesController < ApplicationController

  def index
    redirect_to appropriate_path if user_signed_in?
  end

  def give

  end

  def find_client_profile
    @client_profiles = ClientProfile.search_by_username search_params
    if @client_profiles.blank?
      flash[:notice] = "Sorry, no clients with that username."
      render 'give'
    elsif @client_profiles.count == 1
      redirect_to "/profiles/#{@client_profiles.first.username}"
    else
      render 'give'
    end
  end

  private

  def process_search_results

  end

  def search_params
    params.permit(:search_params)["search_params"]
  end

  def appropriate_path
    needs_organization? ? new_admin_organization_path : '/admin'
  end

  def needs_organization?
    current_user.needs_organization?
  end
end
