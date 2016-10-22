class ServiceOffering < ApplicationRecord
  belongs_to :service
  has_many :housing_attributes
end
