class ServiceOffering < ApplicationRecord
  belongs_to :service
  belongs_to :location
  has_many :eligibility_criteria, through: :offering_eligibility_criterias
end
