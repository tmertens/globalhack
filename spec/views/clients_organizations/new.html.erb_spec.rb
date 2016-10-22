require 'rails_helper'

RSpec.describe "clients_organizations/new", type: :view do
  before(:each) do
    assign(:clients_organization, ClientsOrganization.new(
      :client_id => "",
      :organization_id => ""
    ))
  end

  it "renders new clients_organization form" do
    render

    assert_select "form[action=?][method=?]", clients_organizations_path, "post" do

      assert_select "input#clients_organization_client_id[name=?]", "clients_organization[client_id]"

      assert_select "input#clients_organization_organization_id[name=?]", "clients_organization[organization_id]"
    end
  end
end
