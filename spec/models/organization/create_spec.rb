require 'rails_helper'

describe Organization::Create do
  let(:user) { User.create!(email: 'mr.mittens@fuckrails.com', password: 'timhatesrails') }

  it 'creates a new organization by name' do
    expect {
      org = described_class.call!(name: 'Trump University', owner: user)
      expect(org.name).to eq 'Trump University'
    }.to change { Organization.count }.by 1
  end
end
