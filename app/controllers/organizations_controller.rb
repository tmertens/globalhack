class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
    redirect_to 'dashboard#index'
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    Organization::Create.call!(name: org_name, owner: current_user)
    redirect_to admin_path
  end

  def update
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path
  end

  private

  def org_name
    params.require(:organization).permit(:name)['name']
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

end
