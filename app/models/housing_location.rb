class HousingLocation < ApplicationRecord
  belongs_to :organization
  has_many   :housing_units
  has_many   :contacts, as: :contactable
  has_many   :housing_attributes
  belongs_to :address
end
