class OfferingEligibilityCriteria < ApplicationRecord
  belongs_to :service_offering
  belongs_to :eligibility_criteria
end
