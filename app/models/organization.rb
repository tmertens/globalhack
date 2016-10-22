class Organization < ApplicationRecord
  has_many :clients_organizations
  has_many :clients, through: :clients_organizations
  has_many :housing_locations
  has_many :contacts, as: :contactable
end
