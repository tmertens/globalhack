require 'rails_helper'

RSpec.describe "helps/edit", type: :view do
  before(:each) do
    @help = assign(:help, Help.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => 1,
      :dependents => false
    ))
  end

  it "renders the edit help form" do
    render

    assert_select "form[action=?][method=?]", help_path(@help), "post" do

      assert_select "input#help_first_name[name=?]", "help[first_name]"

      assert_select "input#help_last_name[name=?]", "help[last_name]"

      assert_select "input#help_gender[name=?]", "help[gender]"

      assert_select "input#help_dependents[name=?]", "help[dependents]"
    end
  end
end
