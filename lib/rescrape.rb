require 'axlsx'
require 'securerandom'
require 'colorize'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'dotenv/load'
require 'sqlite3'
require 'active_record'
require 'httparty'
require 'require_all'

require_rel 'rescrape'
require_rel 'support'

DBRegistry[ENV["ACTIVE_RECORD_ENV"]].connect!
DB = ActiveRecord::Base.connection

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
