class Launcher
  attr_reader :game, :board, :player_one, :player_two

  def initialize
    @board      = Board.new
    @player_one = Human.new(Parameters::X_SYMBOL, InputHelper)
    @player_two = Computer.new(Parameters::O_SYMBOL)
    @game       = Game.new(@board, @player_one, @player_two)
  end

  def launch
    game.start
    puts @board.grid.to_s
    while(game.started?)
      game.play
      puts @board.grid.to_s
      OutputHelper.print_state(game.state)
    end

  end

end
