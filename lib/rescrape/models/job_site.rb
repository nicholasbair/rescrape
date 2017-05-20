class Rescrape::JobSite
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end
end
