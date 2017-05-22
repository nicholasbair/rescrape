class Rescrape::JobSite < ActiveRecord::Base
  has_many :searches
  has_many :jobs, through: :searches
  # attr_accessor :name
  #
  # @@all = []
  #
  # def initialize(name)
  #   @name = name
  # end
end
