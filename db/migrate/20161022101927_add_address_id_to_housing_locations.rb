class AddAddressIdToHousingLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_id, :integer
    add_index  :locations, :address_id
  end
end
