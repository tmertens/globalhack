require 'rails_helper'

RSpec.describe "client_profiles/index", type: :view do
  before(:each) do
    assign(:client_profiles, [
      ClientProfile.create!(
        :client => nil,
        :name => "Name",
        :bio => "MyText"
      ),
      ClientProfile.create!(
        :client => nil,
        :name => "Name",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of client_profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
