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
    hashed_provided_secret == profile.hashed_public_secret
  end

  def hashed_provided_secret
    @hashed_provided_secret ||= ClientProfile.digest provided_text_secret
  end

end
