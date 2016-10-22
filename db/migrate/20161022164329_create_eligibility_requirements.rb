class CreateEligibilityRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibility_requirements do |t|
      t.string :name
    end
    add_reference :eligibility_requirements, :eligibility_requirement_category, index: { name: 'eligibility_reqs_to_categories_ref' }
  end
end
