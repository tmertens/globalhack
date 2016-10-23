require 'rails_helper'

RSpec.describe "helps/index", type: :view do
  before(:each) do
    assign(:helps, [
      Help.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => 2,
        :dependents => false
      ),
      Help.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => 2,
        :dependents => false
      )
    ])
  end

  it "renders a list of helps" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
