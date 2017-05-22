class Rescrape::JobSite < ActiveRecord::Base
  has_many :searches
  has_many :jobs, through: :searches
end
