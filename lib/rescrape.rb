require 'axlsx'
require 'securerandom'
require 'colorize'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'dotenv/load'
require 'sqlite3'
require 'active_record'

# TODO:
# Dir[File.join(File.dirname(__FILE__), "./rescrape", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "./support", "*.rb")].each {|f| require f}

require_relative './rescrape/version'
require_relative './rescrape/controllers/controller'
require_relative './rescrape/excel'

require_relative './rescrape/models/job'
require_relative './rescrape/models/search'
require_relative './rescrape/models/company'
require_relative './rescrape/models/job_site'

require_relative './rescrape/scrapers/scrape'
require_relative './rescrape/scrapers/scrape_indeed'
require_relative './rescrape/scrapers/scrape_dice'
require_relative './rescrape/scrapers/scrape_career_builder'
require_relative './rescrape/scrapers/scrape_cyber_coders'

require_relative './support/connection_adapter'
require_relative './support/db_registry'

# DBNAME = "rescrape"

# DBRegistry[ENV["ACTIVE_RECORD_ENV"]].connect!
DBRegistry["development"].connect!
DB = ActiveRecord::Base.connection

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
