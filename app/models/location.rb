class Location < ApplicationRecord
  belongs_to :organization
  has_many   :service_offerings
  has_many   :services, through: :service_offerings
  has_many   :contacts, as: :contactable
  belongs_to :address
end
