class ServiceOffering < ApplicationRecord
  belongs_to :offering_category
  has_many :housing_attributes
end
