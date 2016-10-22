require 'rails_helper'

RSpec.describe "clients_organizations/index", type: :view do
  before(:each) do
    assign(:clients_organizations, [
      ClientsOrganization.create!(
        :client_id => "",
        :organization_id => ""
      ),
      ClientsOrganization.create!(
        :client_id => "",
        :organization_id => ""
      )
    ])
  end

  it "renders a list of clients_organizations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
