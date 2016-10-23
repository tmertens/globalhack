require 'rails_helper'

RSpec.describe "intake_forms/edit", type: :view do
  before(:each) do
    @intake_form = assign(:intake_form, IntakeForm.create!(
      :vispdat_score => 1,
      :substance_abuse => false,
      :utility_debt => false,
      :mental_illness => false
    ))
  end

  it "renders the edit intake_form form" do
    render

    assert_select "form[action=?][method=?]", intake_form_path(@intake_form), "post" do

      assert_select "input#intake_form_vispdat_score[name=?]", "intake_form[vispdat_score]"

      assert_select "input#intake_form_substance_abuse[name=?]", "intake_form[substance_abuse]"

      assert_select "input#intake_form_utility_debt[name=?]", "intake_form[utility_debt]"

      assert_select "input#intake_form_mental_illness[name=?]", "intake_form[mental_illness]"
    end
  end
end
