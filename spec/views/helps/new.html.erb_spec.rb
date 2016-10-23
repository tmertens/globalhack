require 'rails_helper'

RSpec.describe "helps/new", type: :view do
  before(:each) do
    assign(:help, Help.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => 1,
      :dependents => false
    ))
  end

  it "renders new help form" do
    render

    assert_select "form[action=?][method=?]", helps_path, "post" do

      assert_select "input#help_first_name[name=?]", "help[first_name]"

      assert_select "input#help_last_name[name=?]", "help[last_name]"

      assert_select "input#help_gender[name=?]", "help[gender]"

      assert_select "input#help_dependents[name=?]", "help[dependents]"
    end
  end
end
