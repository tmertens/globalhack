class CreateClientsOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :clients_organizations do |t|
      t.references :client,       foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
    add_index :clients_organizations, :client_id
    add_index :clients_organizations, :organization_id
  end
end
