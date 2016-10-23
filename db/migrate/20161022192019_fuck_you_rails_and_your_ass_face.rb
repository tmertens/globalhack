class FuckYouRailsAndYourAssFace < ActiveRecord::Migration[5.0]
  def change
    change_table :eligibility_criteria do |t|
      t.integer :category_id
    end
    drop_table :eligibility_categories
  end
end
