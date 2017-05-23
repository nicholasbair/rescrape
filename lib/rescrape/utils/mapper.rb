class Rescrape::Mapper
  attr_accessor :origin_city, :origin_state, :dest_city, :dest_state

  include HTTParty

  @@base_uri = "https://maps.googleapis.com/maps/api/directions/json?"

  def initialize(dest_city, dest_state)
    @dest_city = dest_city
    @dest_state = dest_state
    @origin_city = Rescape::User.first.city
    @origin_state = Rescape::User.first.state
  end

  def get_distance
    self.class.get(build_uri)
  end

  private
  def build_uri
    "#{@@base_uri}origin=#{@origin_city},+#{@origin_state}&destination=#{dest_city},+#{dest_state}&departure_time=now&traffic_model=pessimistic&key=#{ENV['GOOGLE_MAPS_API_KEY']}"
  end
end
