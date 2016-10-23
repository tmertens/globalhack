require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to have_many(:clients).through(:clients_organizations) }
  it { is_expected.to have_many(:clients_organizations) }
  it { is_expected.to have_one(:location) }
  it { is_expected.to have_many(:contacts) }
  it { is_expected.to belong_to(:owner) }
end
