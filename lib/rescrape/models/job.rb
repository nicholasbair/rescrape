class Rescrape::Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :search
end
