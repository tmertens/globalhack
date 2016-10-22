class CreateEligibilityRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibility_requirements do |t|
      t.string :name
    end
  end
end
