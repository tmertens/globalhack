require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should belong_to :organization }
  it { should have_many :service_offerings }
  it { should have_many(:services).through(:service_offerings) }
  it { should have_many :contacts }
end
