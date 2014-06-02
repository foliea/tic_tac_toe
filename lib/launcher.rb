require 'input_helper'
require 'output_helper'
require 'board'
require 'game'
require 'human'
require 'computer'

class Launcher
  attr_reader :game, :player_one, :player_two

  def initialize
    @board      = Board.new(3)
    @player_one = Human.new(Params::X_SYMBOL, InputHelper)
    @player_two = Computer.new(Params::O_SYMBOL)
    @game       = Game.new(@board, @player_one, @player_two)
  end

  def set(game)
    @game = game
  end

  def launch
    while (answer = ask_for_new_game)
      case answer
      when 'y'
        start
        display
        run
      when 'n'
        break
      end
    end
  end

  def run
    while play?
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

  def ask_for_new_game
    InputHelper.ask_for_new_game
  end

  def display
    OutputHelper.print_board(@game.board)
    OutputHelper.print_state(@game.state)
  end
end
