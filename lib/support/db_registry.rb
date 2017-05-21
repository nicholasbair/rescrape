require 'ostruct'
require_relative "./connection_adapter"

DBNAME = "rescrape"

DBRegistry ||= OpenStruct.new(test: Rescrape::ConnectionAdapter.new("db/#{DBNAME}-test.db"),
  development: Rescrape::ConnectionAdapter.new("db/#{DBNAME}-development.db"),
  production: Rescrape::ConnectionAdapter.new("db#{DBNAME}-production.db")
  )
