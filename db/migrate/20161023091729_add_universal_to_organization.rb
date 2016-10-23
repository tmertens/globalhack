class AddUniversalToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :universal, :boolean, index: true
  end
end
