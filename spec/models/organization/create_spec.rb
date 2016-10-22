require 'rails_helper'

describe Organization::Create do
  it 'creates a new organization by name' do
    expect {
      org = described_class.call!(name: 'Trump University')
      expect(org.name).to eq 'Trump University'
    }.to change { Organization.count }.by 1
  end
end
