class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.references :client, foreign_key: true
      t.string  :first_name
      t.string  :last_name
      t.date    :date_of_birth
      t.integer :gender
      t.string  :ssn

      t.timestamps
    end
    add_index :people, :gender
    add_index :people, :date_of_birth
  end
end
