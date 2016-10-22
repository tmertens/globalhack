class HousingAttribute < ApplicationRecord
  belongs_to :housing_location
  belongs_to :service_offering
end
