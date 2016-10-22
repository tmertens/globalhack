class CreateClientProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :client_profiles do |t|
      t.references :client, foreign_key: true
      t.string     :username
      t.text       :bio
      t.boolean    :require_secret
      t.timestamps
    end

    add_index :client_profiles, :username, unique: true
  end
end
