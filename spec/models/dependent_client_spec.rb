require 'rails_helper'

RSpec.describe DependentClient, type: :model do
  it { is_expected.to belong_to :parent    }
  it { is_expected.to belong_to :dependent }
end
