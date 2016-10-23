class AddAvatarMaybeAgain < ActiveRecord::Migration[5.0]
  def up
    add_attachment :client_profiles, :avatar
  end

  def down
    remove_attachment :client_profiles, :avatar
  end
end
