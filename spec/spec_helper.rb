Dir["./lib/*.rb"].each { |file| require file }

require 'stringio'

RSpec.configure do |config|
  config.mock_with :mocha
end
