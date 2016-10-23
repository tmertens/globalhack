class ServiceOffering < ApplicationRecord
  class FindMatchesForHelpRequest
    include Verbalize

    input :help_params

    def call

      scope = ServiceOffering.all
      scope.joins(:eligibility_criteria).merge(EligibilityCriteria.where(name: help_params['gender']))
      if has_kids?
        scope.joins(:eligibility_criteria).merge(EligibilityCriteria.where(name: 'Families'))
      end
      if domestic_abuse?
        scope.joins(:eligibility_criteria).merge(EligibilityCriteria.where(name: 'Domestic Abuse Victims'))
      end
      scope
      Location.joins(:address).includes(:address).merge(Address.near('St. Louis, MO, US', 5)).joins(:service_offerings).merge(scope).limit(10)
    end

    def has_kids?
      help_params['has_kids'] == 'yes'
    end

    def domestic_abuse?
      help_params['domestic_abuse'] == 'yes'
    end
  end
end
