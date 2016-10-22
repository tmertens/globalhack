class Client < ApplicationRecord
  enum gender: {
    male:   0,
    female: 1,
    other:  2
  }

  has_many   :dependent_clients, class_name: 'Client', foreign_key: 'primary_client_id'
  belongs_to :primary_client, class_name: 'Client'

  has_many :client_service_providers
  has_many :service_providers, through: :client_service_providers
  has_many :contacts, as: :contactable
end
