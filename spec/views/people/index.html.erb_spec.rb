require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :client_id => "",
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => 2
      ),
      Person.create!(
        :client_id => "",
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => 2
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
