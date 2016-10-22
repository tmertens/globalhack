# The idea of the magic phrase is that it works as a way for a client to
# "take their data with them" without having a login
# they can give their magic phrase to an admin user at a new organization,
# and it allows that org to pull that client's data from all other service providers
class MagicPhrase < ApplicationRecord

  attr_accessor :plain_magic_phrase

  class << self
    def digest(value)
      Digest::SHA256.hexdigest value
    end
  end

  belongs_to :client, primary_key: :uuid, foreign_key: :client_uuid

  before_save :hash_the_magic_phrase

  private

  def hash_the_magic_phrase
    if plain_magic_phrase
      self.hashed_public_secret = self.class.digest plain_magic_phrase
    end
  end

end
