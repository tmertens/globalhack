require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to :contactable }
  it { should define_enum_for :contact_type }
end
