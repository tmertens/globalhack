class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.uuid   :uuid
      t.string :name

      t.timestamps
    end
  end
end
