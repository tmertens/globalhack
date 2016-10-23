class Location < ApplicationRecord
  belongs_to :organization
  belongs_to :address

  has_many   :service_offerings
  has_many   :services, through: :service_offerings
  has_many   :contacts, as: :contactable

  def phone
    @phone ||= contacts.where(contact_type: :phone_number).first
  end

  def presentable_phone_number
    matches = number_matcher
    return unless matches
    "(#{matches[1]}) #{matches[2]}-#{matches[3]}"
  end

  def phoneable
    matches = number_matcher
    return unless matches
    matches[1] + matches[2] + matches[3]
  end

  def number_matcher
    /1?.*([0-9]{3}).*([0-9]{3}).*([0-9]{4})/.match(phone.value)
  end

  def email
    contacts.where(contact_type: :email_address).first.value
  end
end
