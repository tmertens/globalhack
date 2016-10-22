class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :client, foreign_key: true
      t.references :organization, foreign_key: true
      t.date :eff_date
      t.integer :amount_cents

      t.timestamps
    end
  end
end
