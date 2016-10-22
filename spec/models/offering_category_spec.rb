require 'rails_helper'

RSpec.describe OfferingCategory, type: :model do
  it { should have_many :service_offerings }
end
