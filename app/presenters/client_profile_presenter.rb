require 'digest'

class ClientProfilePresenter

  def initialize(profile, provided_text_secret)
    @profile
  end

  # metaprogram this pattern?
  def bio
    full_profile_viewable? ? profile.bio : ''
  end

  private

  attr_reader :profile

  def full_profile_viewable?
    profile.secret_not_required? || correct_secret_provided?
  end

  def correct_secret_provided?
    defined?(:@correct_secret_provided) or
      @correct_secret_provided = (hashed_provided_secret == profile.hashed_public_secret)
  end

  def hashed_provided_secret
    @hashed_provided_secret ||= ClientProfile.digest provided_text_secret
  end

end
