class CreatePossiblePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :possible_payments do |t|
      t.integer :client_id
      t.string :digested_token

      t.timestamps
    end
    add_index :possible_payments, :digested_token
  end
end
