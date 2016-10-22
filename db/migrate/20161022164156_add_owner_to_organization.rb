class AddOwnerToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_reference(:organizations, :owner, foreign_key: {to_table: :users})
  end
end
