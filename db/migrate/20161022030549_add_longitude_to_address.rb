class AddLongitudeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :longitude, :float
  end
end
