class HousingLocation < ApplicationRecord
  class Create
    include Verbalize

    input :organization, optional: [:address]

    def call
      HousingLocation.create! do |location|
        location.organization = organization
        location.address = address if address.present?
      end
    end
  end
end
