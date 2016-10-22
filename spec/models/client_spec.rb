require 'rails_helper'

RSpec.describe Client, type: :model do
  it { is_expected.to have_many(:organizations).through(:clients_organizations) }
  it { is_expected.to have_many :contacts }
  it { is_expected.to have_many :dependent_clients }
  it { is_expected.to belong_to :primary_client }
end
