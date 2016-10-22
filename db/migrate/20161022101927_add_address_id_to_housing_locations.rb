class AddAddressIdToHousingLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :housing_locations, :address_id, :integer
    add_index  :housing_locations, :address_id
  end
end
