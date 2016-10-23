class ClientProfile < ApplicationRecord
  belongs_to :client

  attr_accessor :avatar_file_name

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "user_default.png"

  validates :username, uniqueness: true

  # TODO: this is not prod safe yet, anyone can upload whatever they want
  do_not_validate_attachment_file_type :avatar

  def self.find_by_username(name)
    return unless name.present?
    return exact_match(name) if exact_match(name).present?
    where("client_profiles.username ILIKE ?", "%#{name}%")
  end

  def self.exact_match(name)
    where(username: name)
  end

  def secret_not_required?
    !require_secret?
  end

end
