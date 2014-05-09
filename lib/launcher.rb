class Launcher
  attr_reader :game, :board, :player_one, :player_two

  def initialize
    @board      = Board.new(3)
    @player_one = Human.new(Params::X_SYMBOL, InputHelper)
    @player_two = Computer.new(Params::O_SYMBOL)
    @game       = Game.new(@board, @player_one, @player_two)
  end

  def launch
    answer = InputHelper.ask_for_new_game
    play_game if answer == 'y'
  end

  def play?
    @game.started?
  end

end
