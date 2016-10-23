class ClientProfile < ApplicationRecord
  belongs_to :client

  validates :username, uniqueness: true

  # paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def secret_not_required?
    !require_secret?
  end
end
