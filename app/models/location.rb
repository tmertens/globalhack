class Location < ApplicationRecord
  belongs_to :organization
  belongs_to :address

  has_many   :service_offerings
  has_many   :services, through: :service_offerings
  has_many   :contacts, as: :contactable

end
