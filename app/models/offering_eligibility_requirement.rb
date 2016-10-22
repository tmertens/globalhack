class OfferingEligibilityRequirement < ApplicationRecord
  belongs_to :service_offering
  belongs_to :eligibility_requirement
end
