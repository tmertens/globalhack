class EligibilityCriteria < ApplicationRecord
  has_many :service_offerings, through: :OfferingEligibilityCriteria

  has_many :eligibility_criteria, class_name: 'EligibilityCriteria', foreign_key: :category_id
  belongs_to :category, class_name: 'EligibilityCriteria', foreign_key: :category_id, optional: true


  scope :top_level_criteria, -> { where(category_id: nil) }

  def category?
    eligibility_criteria.any?
  end
end
