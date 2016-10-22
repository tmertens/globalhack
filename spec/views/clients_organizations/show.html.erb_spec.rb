require 'rails_helper'

RSpec.describe "clients_organizations/show", type: :view do
  before(:each) do
    @clients_organization = assign(:clients_organization, ClientsOrganization.create!(
      :client_id => "",
      :organization_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
