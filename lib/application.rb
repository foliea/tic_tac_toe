require 'game'
require 'board'
require 'human'
require 'computer'
require 'game_status'
require 'input_helper'
require 'output_helper'

class Application

  def initialize
    @game = Game.new
  end

  def launch
    answer = InputHelper.ask_for_new_game
    if answer == 'y'
      status = @game.start
      OutputHelper.print_start(@game.board)
    end
    while @game.started?
      status = @game.play
      OutputHelper.print_game(@game.board)
      OutputHelper.print_status(status)
    end
  end

end
