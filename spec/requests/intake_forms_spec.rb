require 'rails_helper'

RSpec.describe "IntakeForms", type: :request do
  describe "GET /intake_forms" do
    it "works! (now write some real specs)" do
      get intake_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
