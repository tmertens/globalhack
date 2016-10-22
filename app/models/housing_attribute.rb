class HousingAttribute < ApplicationRecord
  belongs_to :location
  belongs_to :service_offering
end
