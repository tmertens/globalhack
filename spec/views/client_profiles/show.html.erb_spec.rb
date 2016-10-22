require 'rails_helper'

RSpec.describe "client_profiles/show", type: :view do
  before(:each) do
    @client_profile = assign(:client_profile, ClientProfile.create!(
      :client => nil,
      :name => "Name",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
