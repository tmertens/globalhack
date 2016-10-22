require 'rails_helper'

RSpec.describe HousingAttribute, type: :model do
  it { should belong_to :housing_location }
  it { should belong_to :service_offering }
end
