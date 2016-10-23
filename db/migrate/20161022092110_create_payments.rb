class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :client_id
      t.integer :organization_id
      t.integer :possible_payment_id

      t.string  :clearing_house,   null: false, index: true
      t.string  :transaction_id,   null: false

      t.date    :eff_date,      null: false, index: true
      t.integer :amount_cents,  null: false

      t.timestamps
    end
  end
end
