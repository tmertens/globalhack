class ClientProfile < ApplicationRecord
  belongs_to :client

  validates :username, uniqueness: true

  attr_accessor :plain_text_secret

  before_save :hash_plain_text_secret

  class << self
    def digest(value)
      Digest::SHA256.digest value
    end
  end

  def secret_not_required?
    !require_secret?
  end

  private

  def hash_plain_text_secret
    if plain_text_secret
      self.hashed_public_secret = self.class.digest plain_text_secret
    end
  end

end
