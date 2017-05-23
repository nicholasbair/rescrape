class Rescrape::Mapper
  attr_accessor :origin_city, :origin_state, :dest_city, :dest_state

  include HTTParty

  @@base_uri = "https://maps.googleapis.com/maps/api/directions/json?"

  def initialize(dest_lat, dest_lng)
    @dest_lat = dest_lat
    @dest_lng = dest_lng
    @origin_lat = Rescape::User.first.lat
    @origin_lng = Rescape::User.first.lng
  end

  def get_distance
    result = self.class.get(build_uri)
    result.parsed_response["routes"][0]["legs"][0]
  end

  private
  def build_uri
    "#{@@base_uri}origin=#{@origin_lat},#{@origin_lng}&destination=#{dest_lat},+#{dest_lng}&departure_time=now&traffic_model=pessimistic&key=#{ENV['GOOGLE_MAPS_API_KEY']}"
  end
end
