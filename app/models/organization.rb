class Organization < ApplicationRecord
  has_many :clients_organizations
  has_many :clients, through: :clients_organizations
  has_many :locations
  has_many :contacts, as: :contactable

  has_many :client_data_authorizations
end
