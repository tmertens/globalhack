class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.uuid      :uuid,           null: false, index: true
      t.string    :informal_name
      t.timestamps
    end
  end
end
