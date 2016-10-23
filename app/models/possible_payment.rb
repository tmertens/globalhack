class PossiblePayment < ApplicationRecord
  belongs_to :client

  attr_accessor :client_token

  class << self
    def digest(value)
      Digest::SHA256.hexdigest value
    end
  end

  before_create :digest_token

  def digest_token
    self.digested_token = self.class.digest client_token
  end


end
