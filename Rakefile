require "bundler/gem_tasks"
require "rake/testtask"
require 'active_record'

include ActiveRecord::Tasks

task :environment do
  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  # require_relative './config/environment'
  require_relative './lib/rescrape'
end

DatabaseTasks.db_dir = './db'
DatabaseTasks.migrations_paths = './db/migrate'

seed_loader = Class.new do
  def load_seed
    load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
  end
end
DatabaseTasks.seed_loader = seed_loader.new
load 'active_record/railties/databases.rake'

task :console => :environment do
  Pry.start
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test
