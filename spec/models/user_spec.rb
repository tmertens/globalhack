require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:organization).with_foreign_key('owner_id') }

  let(:user) { described_class.new(email: "cat.wrangler@ilovecats.com", password: "catwrangler") }

  context 'without an organization' do
    it "is true" do
      expect(user.needs_organization?).to eq(true)
    end
  end

  context 'with an organization' do
    let!(:organization) { Organization.create(owner: user) }
    it "is false" do
      expect(user.needs_organization?).to eq(false)
    end
  end
end
