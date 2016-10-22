class CreateHousingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :housing_units do |t|
      t.references :housing_location, foreign_key: true

      t.timestamps
    end
  end
end
