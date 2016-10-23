class HelpsController < ApplicationController
  def show
  end

  # GET /helps/new
  def new
    @help_type = params['help_type']
  end

  # GET /helps/1/edit
  def edit
  end

  # POST /helps
  # POST /helps.json
  def create
    matching_service_providers = ::ServiceOffering::FindMatchesForHelpRequest.call!(help_params: help_params)
    service_provider_ids = matching_service_providers.map(&:id)
    return redirect_to '/helps/matching_service_providers',
                       service_providers: service_provider_ids
  end

  def matching_service_providers
    @locations = ::ServiceOffering::FindMatchesForHelpRequest.call!(help_params: help_params)
    @addresses = @locations.map(&:address)
    @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_params
      params.permit(:need_housing, :gender, :has_kids, :help_type)
    end
end
