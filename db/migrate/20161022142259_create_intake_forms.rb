class CreateIntakeForms < ActiveRecord::Migration[5.0]
  def change
    create_table :intake_forms do |t|
      t.integer :vispdat_score
      t.boolean :substance_abuse
      t.boolean :utility_debt
      t.boolean :mental_illness

      t.timestamps
    end
  end
end
