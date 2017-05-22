class Rescrape::Job < ActiveRecord::Base
  belong_to :company
  belong_to :search
  # attr_accessor :company, :title, :location, :description, :url, :full_description
  # @@all = []
  #
  # def initialize(data_hash)
  #   data_hash.each { |k, v| self.send("#{k}=", v) }
  #   @@all << self
  #   puts "Creating job ##{@@all.size}: #{@title} @ #{@company}"
  # end
  #
  # def self.all
  #   @@all
  # end
end
