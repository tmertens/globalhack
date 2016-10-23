class ChangePeople < ActiveRecord::Migration[5.0]
  def change
    change_table :people do |t|
      t.string :ssn
      t.boolean :substance_abuser
      t.boolean :domestic_abuse_victim
      t.boolean :prior_violence
      t.integer :vispdat_score
    end
  end
end
