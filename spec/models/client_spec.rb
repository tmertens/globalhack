require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many :service_providers }
  it { should define_enum_for :gender }
  it { should have_many :contacts }
  it { should have_many :dependent_clients }
  it { should belong_to :primary_client }
end
