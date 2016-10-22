class ServiceOffering < ApplicationRecord
  class AddCriteria
    include Verbalize

    input :offering, :criteria_ids

    def call
      id_array = Array(criteria_ids) # Ensure an array

      return if id_array.empty?

      id_array.map do |criteria_id|
        OfferingEligibilityCriteria.create! do |eligibility_criteria|
          eligibility_criteria.eligibility_criteria_id = criteria_id
          eligibility_criteria.service_offering = offering
        end
      end
    end
  end
end
