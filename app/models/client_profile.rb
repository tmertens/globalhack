class ClientProfile < ApplicationRecord
  belongs_to :client

  validates :username, uniqueness: true

  def secret_not_required?
    !require_secret?
  end

end
