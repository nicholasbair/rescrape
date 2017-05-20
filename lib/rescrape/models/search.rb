class Rescrape::Search
  attr_accessor :location, :keywords

  @@all = []

  def initialize(options = {})
    options.each { |k, v| self.send("#{k}=", v) }
  end
end
