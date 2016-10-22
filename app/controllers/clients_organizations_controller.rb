class ClientsOrganizationsController < ApplicationController
  before_action :set_clients_organization, only: [:show, :edit, :update, :destroy]

  # GET /clients_organizations
  # GET /clients_organizations.json
  def index
    @clients_organizations = ClientsOrganization.all
  end

  # GET /clients_organizations/1
  # GET /clients_organizations/1.json
  def show
  end

  # GET /clients_organizations/new
  def new
    @clients_organization = ClientsOrganization.new
  end

  # GET /clients_organizations/1/edit
  def edit
  end

  # POST /clients_organizations
  # POST /clients_organizations.json
  def create
    @clients_organization = ClientsOrganization.new(clients_organization_params)

    respond_to do |format|
      if @clients_organization.save
        format.html { redirect_to @clients_organization, notice: 'Clients organization was successfully created.' }
        format.json { render :show, status: :created, location: @clients_organization }
      else
        format.html { render :new }
        format.json { render json: @clients_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients_organizations/1
  # PATCH/PUT /clients_organizations/1.json
  def update
    respond_to do |format|
      if @clients_organization.update(clients_organization_params)
        format.html { redirect_to @clients_organization, notice: 'Clients organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @clients_organization }
      else
        format.html { render :edit }
        format.json { render json: @clients_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients_organizations/1
  # DELETE /clients_organizations/1.json
  def destroy
    @clients_organization.destroy
    respond_to do |format|
      format.html { redirect_to clients_organizations_url, notice: 'Clients organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clients_organization
      @clients_organization = ClientsOrganization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clients_organization_params
      params.require(:clients_organization).permit(:client_id, :organization_id)
    end
end
