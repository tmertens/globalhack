class Address < ApplicationRecord
  has_many :locations

  # IGNORING TERRITORIES
  STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY
              LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND
              OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)

  geocoded_by :geocodable_address
  after_validation :geocode

  def geocodable_address
    geocodable_attributes = [street_1, street_2, city, state, zipcode].compact
    geocodable_attributes.join(', ')
  end
end
