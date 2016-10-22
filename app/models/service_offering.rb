class ServiceOffering < ApplicationRecord
  belongs_to :service
  belongs_to :location
end
