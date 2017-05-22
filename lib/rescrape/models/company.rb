class Rescrape::Company < ActiveRecord::Base
  has_many :jobs
end
