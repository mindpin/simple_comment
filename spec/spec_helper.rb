require 'bundler/setup'
require 'pry'
require 'rspec'
require 'simple_comment'
require 'support/database'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.after(:each) do
    Mongoid.purge!
  end
end
