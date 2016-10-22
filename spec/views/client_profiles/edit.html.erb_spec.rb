require 'rails_helper'

RSpec.describe "client_profiles/edit", type: :view do
  before(:each) do
    @client_profile = assign(:client_profile, ClientProfile.create!(
      :client => nil,
      :name => "MyString",
      :bio => "MyText"
    ))
  end

  it "renders the edit client_profile form" do
    render

    assert_select "form[action=?][method=?]", client_profile_path(@client_profile), "post" do

      assert_select "input#client_profile_client_id[name=?]", "client_profile[client_id]"

      assert_select "input#client_profile_name[name=?]", "client_profile[name]"

      assert_select "textarea#client_profile_bio[name=?]", "client_profile[bio]"
    end
  end
end
