require 'rails_helper'

RSpec.describe HousingLocation, type: :model do
  it { should belong_to :organization }
  it { should have_many :housing_units }
  it { should have_many :contacts }
end
