class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :contact_type
      t.integer :contactable_id
      t.string  :contactable_type
      t.string  :value

      t.timestamps
    end
  end
end
