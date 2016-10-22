class CreateClientServiceProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :client_service_providers do |t|
      t.references :client, foreign_key: true
      t.references :service_providers, foreign_key: true

      t.timestamps
    end
  end
end
