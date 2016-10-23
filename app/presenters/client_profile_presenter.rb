require 'digest'

class ClientProfilePresenter

  def initialize(profile, provided_text_secret)
    @profile = profile
    @provided_text_secret = provided_text_secret
  end

  def username
    profile.username
  end

  # metaprogram this pattern?
  def bio
    authorized? ? profile.bio : ''
  end

  def authorized?
    profile.secret_not_required? || correct_secret_provided?
  end

  # private

  attr_reader :profile, :provided_text_secret

  def correct_secret_provided?
    magic_phrase && (hashed_provided_secret == magic_phrase.hashed_phrase)
  end

  def magic_phrase
    defined?(:@magic_phrase) or @magic_phrase = profile.client.try(:magic_phrase)
    @magic_phrase
  end

  def hashed_provided_secret
    @hashed_provided_secret ||= MagicPhrase.digest provided_text_secret
  end

end
