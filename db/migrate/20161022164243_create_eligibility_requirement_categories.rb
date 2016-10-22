class CreateEligibilityRequirementCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibility_requirement_categories do |t|
      t.string :name
    end
  end
end
