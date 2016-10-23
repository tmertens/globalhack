module Admin
  class OrganizationsController < BaseController
    before_action :load_user

    # def index
    # end

    def new
    end

    def create
      ActiveRecord::Base.transaction do
        params.permit!
        organization = Organization.create!(name: params[:name], owner: current_user)
        location = organization.create_location
        location.address = Address.create!(params[:address])
        service = Service.find(params[:service_id])
        location.save!
        service_offering = ServiceOffering.create!(service: service, location: location)
        params[:eligibility_criteria].each_pair do |criteria_id, value|
          service_offering.eligibility_criteria << EligibilityCriteria.find(criteria_id) if value
        end
      end
      redirect_to '/admin'
    end

    def show
    end

    private

    def load_user
      @user = current_user
    end

    def services
      @services ||= Service.all
    end
    helper_method :services

    def top_level_criteria
      @top_level_criteria ||= EligibilityCriteria.top_level_criteria
    end
    helper_method :top_level_criteria

  end
end
