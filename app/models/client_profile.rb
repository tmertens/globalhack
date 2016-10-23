class ClientProfile < ApplicationRecord
  belongs_to :client

  attr_accessor :avatar_file_name

  # https://devcenter.heroku.com/articles/paperclip-s3
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "user_default.png"

  validates :username, uniqueness: true

  # paperclip validation
  # validates_with AttachmentPresenceValidator, attributes: :avatar
  do_not_validate_attachment_file_type :avatar

  def secret_not_required?
    !require_secret?
  end
end
