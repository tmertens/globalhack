module MapsHelper
  def static_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end

  def coordinates_for(address)
    [address.latitude, address.longitude].join(',')
  end
end
