require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:organization).with_foreign_key('owner_id') }
end
