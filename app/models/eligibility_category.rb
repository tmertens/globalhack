class EligibilityCategory < ApplicationRecord
  belongs_to :category, class_name: 'EligibilityCriteria', primary_key: :id
  belongs_to :eligibility_criteria, class_name: 'EligibilityCriteria', primary_key: :id
end
