class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :state
      t.string :street_1
      t.string :street_2
      t.string :zipcode

      t.timestamps
    end
  end
end
