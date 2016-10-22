require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) do
    Address.create!(street_1: '1 S Compton Ave',
                    city: 'St Louis',
                    state: "MO",
                    zipcode: 63103)
  end

  context '#full_street_address' do
    it 'displays the full address' do
      result = address.full_street_address
      expect(result).to eq('1 S Compton Ave,,St Louis,MO,63103')
    end
  end
end
