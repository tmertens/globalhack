class Organization < ApplicationRecord
  has_many   :clients_organizations
  has_many   :clients, through: :clients_organizations

  has_one    :location
  has_one    :address, through: :location

  has_many   :contacts, as: :contactable

  has_many   :client_data_authorizations
  belongs_to :owner, class_name: 'User'


  accepts_nested_attributes_for :location

end
