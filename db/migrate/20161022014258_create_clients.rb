class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.date :date_of_birth
      t.string :first_name
      t.string :last_name
      t.integer :gender

      t.timestamps
    end
  end
end
