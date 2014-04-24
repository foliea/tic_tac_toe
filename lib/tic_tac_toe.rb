#!/usr/bin/ruby

require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

def display_square(board, location)
  board[location] || '.'
end

def display_board(board)
  puts " #{display_square(board, 0)} | #{display_square(board, 1)} | #{display_square(board, 2)}\n" +
       "-----------\n" +
       " #{display_square(board, 3)} | #{display_square(board, 4)} | #{display_square(board, 5)}\n" +
       "-----------\n" +
       " #{display_square(board, 6)} | #{display_square(board, 7)} | #{display_square(board, 8)}\n"
end

def start_game(game)
  status = game.start()

  puts "-- New Game Started --\n"
  puts "-- Notif: #{status[:message]} --\n"
  display_board(game.get_display)
  puts INFOS
end

def play_game(game, move)
  if !game.started?
    start_game(game)
  end
  status = game.play(move)

  puts "Error: #{status[:message]}" if status[:code] == -1
  puts "Warning: #{status[:message]}" if status[:code] == 1
  puts "Notif: #{status[:message]}" if status[:code] == 0

  display_board(game.get_display)
end

if __FILE__ == $PROGRAM_NAME
  INFOS = 'Please enter your move (between 1 and 9) :'
  game = Game.new

  start_game(game)
  ARGF.each do |line|
    move = line.to_i - 1
    play_game(game, move) if (0..9).include?(move)

    puts INFOS
  end
end
