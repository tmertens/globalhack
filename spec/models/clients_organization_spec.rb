require 'rails_helper'

RSpec.describe ClientsOrganization, type: :model do
  it { is_expected.to belong_to :client }
  it { is_expected.to belong_to :organization }

end
