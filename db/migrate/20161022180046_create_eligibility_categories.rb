class CreateEligibilityCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibility_categories do |t|
      t.integer :eligibility_criteria_id
      t.integer :category_id
    end
  end
end
