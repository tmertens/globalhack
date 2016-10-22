class AddLongitudedToAddress < ActiveRecord::Migration[5.0]
  def change
    change_table :addresses do |t|
      t.float :longitude
    end
  end
end
