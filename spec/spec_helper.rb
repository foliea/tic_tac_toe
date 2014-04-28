Dir["./lib/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.mock_with :mocha
end
