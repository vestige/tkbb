module GymsHelper
  def map_url(gym)
    "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{gym.latitude}%2C#{gym.longitude}"
  end
end
