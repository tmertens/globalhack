require 'rails_helper'

RSpec.describe "client_profiles/new", type: :view do
  before(:each) do
    assign(:client_profile, ClientProfile.new(
      :client => nil,
      :name => "MyString",
      :bio => "MyText"
    ))
  end

  it "renders new client_profile form" do
    render

    assert_select "form[action=?][method=?]", client_profiles_path, "post" do

      assert_select "input#client_profile_client_id[name=?]", "client_profile[client_id]"

      assert_select "input#client_profile_name[name=?]", "client_profile[name]"

      assert_select "textarea#client_profile_bio[name=?]", "client_profile[bio]"
    end
  end
end
