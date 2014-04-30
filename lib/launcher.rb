class Launcher
  attr_reader :game, :board, :player_one, :player_two
  
  def initialize
    @board      = Board.new
    @player_one = Human.new(Parameters::X_SYMBOL, InputHelper)
    @player_two = Computer.new(Parameters::O_SYMBOL)
    @game       = Game.new(@board, @player_one, @player_two)
  end
end