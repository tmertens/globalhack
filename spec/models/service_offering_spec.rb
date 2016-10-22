require 'rails_helper'

RSpec.describe ServiceOffering, type: :model do
  it { should belong_to :offering_category }
  it { should have_many :housing_attributes }
end
