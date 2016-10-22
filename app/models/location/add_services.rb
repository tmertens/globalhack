class Location < ApplicationRecord
  class AddServices
    include Verbalize

    input :location, :service_ids

    def call
      service_ids.each do |service_id|
        ServiceOffering.create! do |offering|
          offering.service_id = service_id
          offering.organization = organization
          offering.address = address if address.present?
        end
      end
    end
  end
end
