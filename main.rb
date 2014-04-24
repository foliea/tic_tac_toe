#!/usr/bin/ruby

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/opponent'

def display_board(board)
  #puts "#{board[0]} #{board[1]} #{board[2]}"
  #puts "#{board[3]} #{board[4]} #{board[5]}"
  #puts "#{board[6]} #{board[7]} #{board[8]}"
  puts board.to_s
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  inst = 'Please enter your move'

  puts inst
  game.start
  display_board(game.get_board)
  ARGF.each do |line|

    puts game.play(line.to_i)
    display_board(game.get_board)
    puts inst
  end
end
