class CreateHousingAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :housing_attributes do |t|
      t.references :location, foreign_key: true
      t.references :service_offering, foreign_key: true

      t.timestamps
    end
  end
end
