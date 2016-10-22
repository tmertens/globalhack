class ServiceProvider < ApplicationRecord
  has_many :client_service_providers
  has_many :clients, through: :client_service_providers
end
