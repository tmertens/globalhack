class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.uuid        :uuid
      t.string      :informal_name
      t.references  :primary_client, index: true
      t.timestamps
    end
  end
end
