class Game
  attr_reader :started, :board, :player_one, :player_two

  alias :started? :started

  def initialize(board, player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board      = board
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
    return Parameters::X_SYMBOL if @board.win?(Parameters::X_SYMBOL)
    return Parameters::O_SYMBOL if @board.win?(Parameters::O_SYMBOL)
    return -1 if @board.draw?
    return 0
  end

  def switch_players
    @player_one = @player_two = @player_one
  end
end
