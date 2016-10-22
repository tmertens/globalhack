require 'rails_helper'

RSpec.describe "ClientProfiles", type: :request do
  describe "GET /client_profiles" do
    it "works! (now write some real specs)" do
      get client_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
