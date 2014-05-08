class Game
  attr_reader :started, :forbidden_move, :board, :player_one, :player_two, :current_player

  alias :started?        :started
  alias :forbidden_move? :forbidden_move

  PLAYING        = 0
  NOT_STARTED    = 1
  X_SYMBOL_WIN   = 2
  O_SYMBOL_WIN   = 3
  DRAW           = 4
  FORBIDDEN_MOVE = 5

  def initialize(board, player_one, player_two)
    @board          = board
    @player_one     = player_one
    @player_two     = player_two
    @current_player = @player_one
    @started        = false
  end

  def start
    @started = true
    @board.reset
  end

  def stop
    @started = false
  end

  def play
    return state if !started?

    if @current_player.move(@board)
      @forbidden_move = false
      switch_players
    else
      @forbidden_move = true
    end

    stop if @board.over?
    return state
  end

  def state
    return X_SYMBOL_WIN    if @board.win?(Params::X_SYMBOL)
    return O_SYMBOL_WIN    if @board.win?(Params::O_SYMBOL)
    return DRAW            if @board.draw?
    return NOT_STARTED     if !started?
    return FORBIDDEN_MOVE  if forbidden_move?
    return PLAYING
  end

  def switch_players
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end
