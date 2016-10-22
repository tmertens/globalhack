class ClientProfile < ApplicationRecord
  belongs_to :client

  attr_accessor :avatar_file_name

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :username, uniqueness: true

  # TODO: this is not prod safe yet, anyone can upload whatever they want
  do_not_validate_attachment_file_type :avatar

  def secret_not_required?
    !require_secret?
  end

end
