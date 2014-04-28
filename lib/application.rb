require 'game'
require 'board'
require 'player'
require 'computer'
require 'return_codes'
require 'console_display'

class Application

  def initialize
    @player_one = Player.new
    @player_two = Computer.new
    @game = Game.new(@player_one, @player_two)
  end

  def launch
    answer = ConsoleDisplay.ask_new_game
    if answer == 'y'
      status = @game.start
      ConsoleDisplay.print_start(@game.board)
    end
    while @game.started?
      status = @game.play
      ConsoleDisplay.print_game(@game.board)
    end
  end

end
