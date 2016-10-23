class ServiceOffering < ApplicationRecord
  belongs_to :service
  belongs_to :location

  has_many :offering_eligibility_criteria, class_name: 'OfferingEligibilityCriteria'
  has_many :eligibility_criteria, through: :offering_eligibility_criteria
end
