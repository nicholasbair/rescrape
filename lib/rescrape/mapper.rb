class Rescrape::Mapper
  attr_accessor :origin_city, :origin_state, :dest_city, :dest_state

  include HTTParty

  @@base_uri = "https://maps.googleapis.com/maps/api/directions/json?"

  # parsed_response => routes => legs => distance, duration, duration_in_traffic => text

  # "legs"=>
  #      [{"distance"=>{"text"=>"51.2 mi", "value"=>82391},
  #        "duration"=>{"text"=>"1 hour 0 mins", "value"=>3628},
  #        "duration_in_traffic"=>{"text"=>"58 mins", "value"=>3492},
  #        "end_address"=>"Athens, GA, USA",


  def initialize(dest_city, dest_state)
    @dest_city = dest_city
    @dest_state = dest_state
    # @origin_city = Rescape::Home.first.city
    @origin_city = "Duluth"
    # @origin_state = Rescape::Home.first.state
    @origin_state = "GA"
  end

  def get_distance
    self.class.get(build_uri)
  end

  private
  def build_uri
    "#{@@base_uri}origin=#{@origin_city},+#{@origin_state}&destination=#{dest_city},+#{dest_state}&departure_time=now&traffic_model=pessimistic&key=#{ENV['GOOGLE_MAPS_API_KEY']}"
  end
end
