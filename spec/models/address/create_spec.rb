require 'rails_helper'

describe Address::Create do
  it 'creates a new address' do
    expect {
      address = described_class.call!(street_1: '1 S Compton Ave',
                                      street_2: 'Ste 100',
                                      city:     'St. Louis',
                                      state:    'MO',
                                      zipcode: '63103')
      expect(address.street_1).to eq '1 S Compton Ave'
      expect(address.street_2).to eq 'Ste 100'
      expect(address.city).to eq 'St. Louis'
      expect(address.state).to eq 'MO'
      expect(address.zipcode).to eq '63103'
    }.to change { Address.count }.by 1
  end

  it 'fails when no street_1'
  it 'fails when no city, state, or zipcode'
end
