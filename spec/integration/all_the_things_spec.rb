require 'rails_helper'

describe 'Creating a new organization' do
  let!(:service_a) { Service.create!(name: 'service_a') }
  let!(:service_b) { Service.create!(name: 'service_b') }
  let!(:service_c) { Service.create!(name: 'service_c') }
  let!(:service_d) { Service.create!(name: 'service_d') }
  let!(:service_e) { Service.create!(name: 'service_e') }
  let!(:service_f) { Service.create!(name: 'service_f') }

  let!(:criteria_a) { EligibilityCriteria.create!(name: 'criteria_a') }
  let!(:criteria_b) { EligibilityCriteria.create!(name: 'criteria_b') }
  let!(:criteria_c) { EligibilityCriteria.create!(name: 'criteria_c') }

  let!(:user)      { User.create!(email: 'dr_cat@cats.com', password: 'cats4lyfe') }

  specify 'as a new user, I can complete the organization creation process' do
    organization = Organization::Create.call!(name: 'Chaps Chippers', owner: user)

    expect(organization.name).to eq 'Chaps Chippers'
    expect(organization).not_to be_changed

    location = Organization::CreateFirstLocation.call!(organization: organization,
                                                       street_1: '1 S Compton Ave',
                                                       city:     'St Louis',
                                                       state:    'MO',
                                                       zipcode:  '63103',
                                                       phone:    '123-456-1122',
                                                       email:    'chaps.chippers@example.test')

    location = organization.location
    address = location.address
    expect(address.street_1).to eq '1 S Compton Ave'
    expect(address.city).to eq     'St Louis'
    expect(address.state).to eq    'MO'
    expect(address.zipcode).to eq  '63103'

    phone = location.contacts.find_by(contact_type: :phone_number)
    expect(phone.value).to eq '123-456-1122'

    email = location.contacts.find_by(contact_type: :email_address)
    expect(email.value).to eq 'chaps.chippers@example.test'

    offerings = Location::AddServices.call!(location: location,
                                service_ids: [service_a.id,
                                              service_c.id,
                                              service_d.id,
                                              service_f.id])

    expect(location.services).to match_array [service_a, service_c, service_d, service_f]

    offering = offerings.first
    ServiceOffering::AddCriteria.call!(offering: offering,
                                       criteria_ids: [criteria_a.id, criteria_b.id])
    expect(offering.eligibility_criteria).to eq [criteria_a, criteria_b]
  end
end
