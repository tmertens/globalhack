require 'rails_helper'

RSpec.describe ClientServiceProvider, type: :model do
  it { should belong_to :client }
  it { should belong_to :service_provider }
end
