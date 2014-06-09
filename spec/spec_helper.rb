require 'coveralls'

Coveralls.wear! if ENV['COVERALLS_REPO_TOKEN']

RSpec.configure do |config|
  config.mock_with :mocha
end
