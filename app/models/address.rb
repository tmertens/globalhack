class Address < ApplicationRecord

  geocoded_by :full_street_address

  def full_street_address
    "#{street_1},#{street_2},#{city},#{state},#{zipcode}"
  end
end
