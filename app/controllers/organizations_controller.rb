class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    name = params.require(:organization).permit(:name)
    Organization::Create.call!(name: name, owner: current_user)
    redirect_to admin_path
  end

  def update
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

end
