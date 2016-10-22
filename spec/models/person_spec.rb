require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should define_enum_for :gender }

end
