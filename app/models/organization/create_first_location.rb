class Organization < ApplicationRecord
  class CreateFirstLocation
    include Verbalize

    input :organization, :street_1, optional: [:street_2, :city,
                                               :state, :zipcode,
                                               :phone, :email]

    def call
      address = Address::Create.call!(street_1: street_1,
                                      street_2: street_2,
                                      city:     city,
                                      state:     state,
                                      zipcode:  zipcode)
      location = Location::Create.call!(organization: organization,
                                        address:      address)
      create_phone(location)
      create_email(location)

      location
    end

    private

    def create_phone(location)
      return unless phone.present?
      Contact::Create.call!(contactable: location,
                            value:       phone,
                            contact_type: :phone_number)
    end

    def create_email(location)
      return unless email.present?
      Contact::Create.call!(contactable:  location,
                            value:        email,
                            contact_type: :email_address)
    end
  end
end
