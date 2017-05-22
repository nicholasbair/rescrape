class Rescrape::Search < ActiveRecord::Base
  belongs_to :job_site
  has_many :jobs
  # attr_accessor :location, :keywords
  #
  # @@all = []
  #
  # def initialize(options = {})
  #   options.each { |k, v| self.send("#{k}=", v) }
  # end
end
