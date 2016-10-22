require 'rails_helper'

RSpec.describe Client, type: :model do
  it { is_expected.to have_many(:organizations).through(:clients_organizations) }
  it { is_expected.to have_many :contacts }
end
