class Rescrape::Placer
  attr_accessor :name, :city, :state

  include HTTParty

  @@base_uri = "https://maps.googleapis.com/maps/api/"
  @@geocode_stub = "geocode/json?"
  @@places_stub = "place/textsearch/json?"

  def initialize(data_hash)
    data_hash.each { |k, v| self.send("#{k}=", v) }
  end

  # Return hash of lat/lng
  def geocode
    result = self.class.get("#{@@base_uri}#{@@geocode_stub}address=#{@city},+#{@state}&key=#{ENV['GEOCODE_GOOGLE_MAPS_API_KEY']}")
    result.parsed_response["results"][0]["geometry"]["location"]
  end

  # Return hash of lat/lng
  def find_place
    result = self.class.get("#{@@base_uri}#{@@places_stub}query=#{@name}+#{@city}+#{@state}&key=#{ENV['PLACES_GOOGLE_MAPS_API_KEY']}")
    result.parsed_response["results"][0]["geometry"]["location"]
  end
end
