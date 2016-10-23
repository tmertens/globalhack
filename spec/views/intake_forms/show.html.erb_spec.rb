require 'rails_helper'

RSpec.describe "intake_forms/show", type: :view do
  before(:each) do
    @intake_form = assign(:intake_form, IntakeForm.create!(
      :vispdat_score => 2,
      :substance_abuse => false,
      :utility_debt => false,
      :mental_illness => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
