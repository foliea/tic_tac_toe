require 'input_helper'
require 'output_helper'
require 'board'
require 'game'
require 'human'
require 'computer'

class Launcher
  attr_reader   :game, :board, :player_one, :player_two

  def initialize
  	@board 			= Board.new(3)
		@player_one = Human.new(Params::X_SYMBOL, InputHelper)
		@player_two = Computer.new(Params::O_SYMBOL)

		set(Game.new(@board, @player_one, @player_two))				
	end

	def set(game)
		@game = game 	
	end

  def launch
    if InputHelper.ask_for_new_game == 'y'
		end
	end

  def run
    while(play?)
      play
      display
    end
  end

	def start
		@game.start
	end

  def play?
    @game.started?
  end

  def play
    @game.play
  end

  def display
    OutputHelper.print_board(@game.board)
    OutputHelper.print_state(@game.state)
  end

end
