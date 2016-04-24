ENV['RAILS_ENV'] = ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, :assets, ENV['RACK_ENV']

desc 'Load a pry console'
task :console do
  require 'bundler'
  Bundler.require(:default, ENV['RACK_ENV'])
  require './dat_app'
  if defined?(Pry)
    Pry.start
  else
    require 'irb'
    ARGV.clear
    IRB.start
  end
end

namespace 'db' do
  desc "Run database migrations"
  task :migrate do
    require 'sequel'
    require 'yaml'
    config = YAML.load_file("./config/database.yml")[ENV['RACK_ENV']]

    Sequel.extension :migration
    db = Sequel.postgres(config)
    Sequel::Migrator.run(db, "./db/migrations")
  end

  desc "Seed database from './db/seed.rb'"
  task :seed do
    require 'sequel'
    require 'yaml'
    require './app/initializers/sequel'
    require './db/seed'
  end
end

require 'rake/sprocketstask'
require './dat_app'
Rake::SprocketsTask.new do |t|
  environment = App.sprockets
  t.environment = environment
  t.output      = "./public/s"
  t.assets      = %w( application.js application.css )
end
