# For reference, workers spawn before running this file, not after
# So don't do anything dumb like precompiling assets here

require 'bundler'
Bundler.require :default, :assets, ENV['RACK_ENV']

require './app'

if App.development?
  map App.assets_prefix do
    run App.sprockets
  end
end

run App
