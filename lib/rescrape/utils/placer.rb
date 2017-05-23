class Rescrape::Placer
  attr_accessor :name, :city, :state, :lat, :lng

  include HTTParty

  @@base_uri = "https://maps.googleapis.com/maps/api/"
  @@geocode_stub = "geocode/json?"
  @@places_stub = "place/nearbysearch/json?"

  # https://maps.googleapis.com/maps/api/place/textsearch/json?query=123+main+street&key=YOUR_API_KEY

  # https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=YOUR_API_KEY

  # NOTE:
  # Need lat/long for location
  # location == HOME
  # Searching for 'nearby'

  # keyword => name+city+state

  def initialize(data_hash)
    data_hash.each { |k, v| self.send("#{k}=", v) }
    @lat = Rescape::User.first.lat
    @lng = Rescape::User.first.lng
  end

  # Return hash of lat/lng
  def geocode
    result = self.class.get("#{@@base_uri}#{@@geocode_stub}address=#{@city},+#{@state}&key=#{ENV['GEOCODE_GOOGLE_MAPS_API_KEY']}")
    result.parsed_response["results"][0]["geometry"]["location"]
  end

  def find_place
    result = self.class.get("#{@@base_uri}#{@@places_stub}location=#{@lat},#{@lng}&radius=200&keyword=#{@name}+#{@city}+#{@state}&key=#{ENV['PLACES_GOOGLE_MAPS_API_KEY']}")
  end
end
