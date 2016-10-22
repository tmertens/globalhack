require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :client_id => "",
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => 1
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_client_id[name=?]", "person[client_id]"

      assert_select "input#person_first_name[name=?]", "person[first_name]"

      assert_select "input#person_last_name[name=?]", "person[last_name]"

      assert_select "input#person_gender[name=?]", "person[gender]"
    end
  end
end
