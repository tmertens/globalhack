class ClientProfile < ApplicationRecord
  belongs_to :client

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :username, uniqueness: true

  def secret_not_required?
    !require_secret?
  end

end
