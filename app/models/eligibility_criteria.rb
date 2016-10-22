class EligibilityCriteria < ApplicationRecord
  has_many :service_offerings, through: :OfferingEligibilityCriteria

  # Because FUCK RAILS
  has_one :joins_eligibility_categories, class_name: 'EligibilityCategory',
          primary_key: :id, foreign_key: :eligibility_criteria_id
  has_one :joins_eligibility_criteria, class_name: 'EligibilityCategory',
          primary_key: :id, foreign_key: :category_id

  has_many :eligibility_criteria, through: :joins_eligibility_criteria
  has_one :category, through: :joins_eligibility_categories


  scope :categories, -> { joins(:joins_eligibility_criteria)
                            .where.not(eligibility_categories: { id: nil })
                            .uniq }
end
