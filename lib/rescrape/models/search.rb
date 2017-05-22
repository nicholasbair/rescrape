class Rescrape::Search < ActiveRecord::Base
  belongs_to :job_site
  has_many :jobs
end
