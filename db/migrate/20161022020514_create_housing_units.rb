class CreateHousingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :housing_units do |t|
      t.references :location, foreign_key: true
      t.string     :unit_name

      t.timestamps
    end
  end
end
