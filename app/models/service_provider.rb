class ServiceProvider < ApplicationRecord
  has_many :client_service_providers
  has_man :clients, through: :client_service_providers
end
