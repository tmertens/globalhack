class CreateServiceOfferings < ActiveRecord::Migration[5.0]
  def change
    create_table :service_offerings do |t|
      t.string :name
      t.references :offering_category, foreign_key: true

      t.timestamps
    end
  end
end
