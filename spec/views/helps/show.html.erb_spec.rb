require 'rails_helper'

RSpec.describe "helps/show", type: :view do
  before(:each) do
    @help = assign(:help, Help.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :gender => 2,
      :dependents => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
