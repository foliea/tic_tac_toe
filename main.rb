#!/usr/bin/ruby

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/opponent'

def display_board board
  board.each do |row|
    puts row.to_s
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  inst = 'Please enter your move "x" "y"'

  puts inst
  game.start
  display_board(game.get_board)
  ARGF.each do |line|
    x = line.split(' ').first
    y = line.split(' ').last

    puts game.play(x.to_i, y.to_i)
    display_board(game.get_board)
  end
end
