class ClientServiceProvider < ApplicationRecord
  belongs_to :client
  belongs_to :service_provider
end
