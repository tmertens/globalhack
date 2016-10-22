require 'rails_helper'

RSpec.describe "ClientsOrganizations", type: :request do
  describe "GET /clients_organizations" do
    it "works! (now write some real specs)" do
      get clients_organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
