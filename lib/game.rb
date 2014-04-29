class Game
  attr_reader :started, :board, :player_one, :player_two

  alias :started? :started

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board      = Board.new
  end

  def start
    @started = true
  end

  def stop
    @started = false
  end

  def play
    if started?
      @player_one.move(@board)
      switch_players
    end
    stop if winner != 0
  end

  def winner
    return Board::X_SYMBOL if @board.win?(Board::X_SYMBOL)
    return Board::O_SYMBOL if @board.win?(Board::O_SYMBOL)
    return -1 if @board.draw?
    return 0
  end

  def switch_players
    @player_one = @player_two = @player_one
  end
end
