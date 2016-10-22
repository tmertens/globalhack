class Address < ApplicationRecord

  geocoded_by :geocodable_address

  def geocodable_address
    "#{street_1},#{city},#{state},#{zipcode}"
  end
end
