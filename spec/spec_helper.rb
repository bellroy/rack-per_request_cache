require "rubygems"
require "bundler/setup"

require "rack"
require "rspec"
require "rack/test"

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Rack::Test::Methods
end
