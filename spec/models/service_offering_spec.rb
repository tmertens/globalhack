require 'rails_helper'

RSpec.describe ServiceOffering, type: :model do
  it { should belong_to :service }
  it { should belong_to :location }
end
