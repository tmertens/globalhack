class Client < ApplicationRecord
  enum gender: { 
    male:   0,
    female: 1,
    other:  2
  }

  has_many :client_service_providers
  has_many :service_providers, through: :client_service_providers
end
