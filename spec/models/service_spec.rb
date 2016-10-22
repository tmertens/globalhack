require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_many :service_offerings }
end
