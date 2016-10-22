require 'rails_helper'

RSpec.describe HousingUnit, type: :model do
  it { should belong_to :housing_location }
end
