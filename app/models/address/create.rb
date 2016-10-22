require 'verbalize'

class Address < ApplicationRecord
  class Create
    include Verbalize

    input :street_1, :street_2, :city, :state, :zipcode

    def call
      fail!("#{state} is not a valid state") unless valid_state?
      fail!("Street must not be empty!")     unless street_1.present?
      fail!("City, State, or Zipcode must not be empty!") unless localized?

      Address.create! do |address|
        address.street_1 = street_1
        address.street_2 = street_2
        address.city     = city
        address.state    = state
        address.zipcode  = zipcode
      end
    end

    private

    def valid_state?
      STATES.include?(state)
    end

    def localized?
      city.present? || state.present? || zipcode.present?
    end
  end
end
