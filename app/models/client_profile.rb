class ClientProfile < ApplicationRecord
  belongs_to :client

  validates :username, uniqueness: true

  # paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "user_default.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
