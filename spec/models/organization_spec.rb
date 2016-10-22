require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to have_many(:clients).through(:clients_organizations) }
  it { is_expected.to have_many(:clients_organizations) }
  it { is_expected.to have_many(:housing_locations) }
  it { is_expected.to have_many(:contacts) }
end