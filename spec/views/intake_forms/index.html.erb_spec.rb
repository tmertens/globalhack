require 'rails_helper'

RSpec.describe "intake_forms/index", type: :view do
  before(:each) do
    assign(:intake_forms, [
      IntakeForm.create!(
        :vispdat_score => 2,
        :substance_abuse => false,
        :utility_debt => false,
        :mental_illness => false
      ),
      IntakeForm.create!(
        :vispdat_score => 2,
        :substance_abuse => false,
        :utility_debt => false,
        :mental_illness => false
      )
    ])
  end

  it "renders a list of intake_forms" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
