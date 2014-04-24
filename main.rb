require 'pry'

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/opponent'

if __FILE__ == $PROGRAM_NAME
  game = Game.new

  binding.pry
end
