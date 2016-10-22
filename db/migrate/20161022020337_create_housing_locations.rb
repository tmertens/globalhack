class CreateHousingLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :housing_locations do |t|
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
