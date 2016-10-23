class ServiceOffering < ApplicationRecord
  class FindMatchesForHelpRequest
    include Verbalize

    input :help_params

    def call
      gender = help_params['gender'].camelize
      scope = Location
                .joins(:address)
                .includes(:address)
                .merge(Address.near('St. Louis, MO, US', 5))
                .joins(service_offerings: :eligibility_criteria)
                .merge(EligibilityCriteria.where(name: gender))

      if has_kids?
        scope.merge(EligibilityCriteria.where(name: 'Families'))
      end
      if domestic_abuse?
        scope.merge(EligibilityCriteria.where(name: 'Domestic Abuse Victims'))
      end
      scope.limit(10)
    end

    def has_kids?
      help_params['has_kids'] == 'yes'
    end

    def domestic_abuse?
      help_params['domestic_abuse'] == 'yes'
    end
  end
end
