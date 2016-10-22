require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) do
    Address.create!(street_1: '1 S Compton Ave',
                    city: 'St Louis',
                    state: "MO",
                    zipcode: 63103)
  end

  context '#geocodable_address' do
    it 'displays the full address to be used by geocoder' do
      result = address.geocodable_address
      expect(result).to eq('1 S Compton Ave,St Louis,MO,63103')
    end
  end
end
