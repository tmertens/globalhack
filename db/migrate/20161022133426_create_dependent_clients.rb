class CreateDependentClients < ActiveRecord::Migration[5.0]
  def change
    create_table :dependent_clients do |t|
      t.integer :primary_client_id
      t.integer :dependent_client_id

      t.timestamps
    end
  end
end
