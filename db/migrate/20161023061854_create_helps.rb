class CreateHelps < ActiveRecord::Migration[5.0]
  def change
    create_table :helps do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.boolean :dependents
      t.integer :help_type

      t.timestamps
    end
  end
end
