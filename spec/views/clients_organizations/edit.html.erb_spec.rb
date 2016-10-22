require 'rails_helper'

RSpec.describe "clients_organizations/edit", type: :view do
  before(:each) do
    @clients_organization = assign(:clients_organization, ClientsOrganization.create!(
      :client_id => "",
      :organization_id => ""
    ))
  end

  it "renders the edit clients_organization form" do
    render

    assert_select "form[action=?][method=?]", clients_organization_path(@clients_organization), "post" do

      assert_select "input#clients_organization_client_id[name=?]", "clients_organization[client_id]"

      assert_select "input#clients_organization_organization_id[name=?]", "clients_organization[organization_id]"
    end
  end
end
