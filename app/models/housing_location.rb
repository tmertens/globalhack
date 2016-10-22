class HousingLocation < ApplicationRecord
  belongs_to :service_provider
  has_many :housing_units
  has_many :contacts, as: :contactable
end
