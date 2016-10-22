require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  it { should have_many :clients }
end
