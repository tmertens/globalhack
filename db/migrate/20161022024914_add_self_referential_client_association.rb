class AddSelfReferentialClientAssociation < ActiveRecord::Migration[5.0]
  def change
    change_table :clients do |t|
      t.references :primary_client, index: true
    end
  end
end
