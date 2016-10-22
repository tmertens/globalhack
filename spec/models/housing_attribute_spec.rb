require 'rails_helper'

RSpec.describe HousingAttribute, type: :model do
  it { should belong_to :location }
  it { should belong_to :service_offering }
end
