require 'rails_helper'

RSpec.describe ClientProfile, type: :model do
  it { is_expected.to belong_to(:client) }

  describe '.find_by_username' do
    let!(:client_1) { Client.create! }
    let!(:client_2) { Client.create! }
    let!(:client_3) { Client.create! }

    let!(:cp_1) { ClientProfile.create!(client: client_1, username: 'ella') }
    let!(:cp_2) { ClientProfile.create!(client: client_2, username: 'seabass') }
    let!(:cp_3) { ClientProfile.create!(client: client_3, username: 'stella') }

    context 'when there is only one potential match' do
      it 'returns the one match' do
        expect(described_class.search_by_username('seabass')).to contain_exactly(cp_2)
      end
    end

    context 'when there are two potential matches' do
      it 'returns them both' do
        expect(described_class.search_by_username('ell')).to contain_exactly(cp_1, cp_3)
      end
    end

    context 'when there are two similar results but an exact match' do
      it 'returns the exact match' do
        expect(described_class.search_by_username('ella')).to contain_exactly(cp_1)
      end
    end
  end
end
