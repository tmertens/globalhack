class CreateClientsOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :clients_organizations do |t|
      t.foreign_key :client_id
      t.foreign_key :organization_id

      t.timestamps
    end
    add_index :clients_organizations, :client_id
    add_index :clients_organizations, :organization_id
  end
end
