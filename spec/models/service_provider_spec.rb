require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  it { should have_many :clients }
  it { should have_many :housing_locations }
end
