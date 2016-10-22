require 'rails_helper'

describe 'Creating a new organization' do
  specify 'as a new user, I can complete the organization creation process' do
    organization = Organization::Create.call!(name: 'Chaps Chippers')
    Organization::CreateFirstLocation.call!(organization: organization,
                                            street_1: '1 S Compton Ave',
                                            city:     'St Louis',
                                            state:    'MO',
                                            zipcode:  '63103',
                                            phone:    '123-456-1122',
                                            email:    'chaps.chippers@example.test')
    expect(organization.name).to eq 'Chaps Chippers'
    expect(organization).not_to be_changed

    location = organization.housing_locations.first
    address = location.address
    expect(address.street_1).to eq '1 S Compton Ave'
    expect(address.city).to eq     'St Louis'
    expect(address.state).to eq    'MO'
    expect(address.zipcode).to eq  '63103'

    phone = location.contacts.find_by(contact_type: :phone_number)
    expect(phone.value).to eq '123-456-1122'

    email = location.contacts.find_by(contact_type: :email_address)
    expect(email.value).to eq 'chaps.chippers@example.test'
  end
end
