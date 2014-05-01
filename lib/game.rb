class Game
  attr_reader :started, :forbidden_move, :board, :player_one, :player_two

  alias :started? :started
  alias :forbidden_move? :forbidden_move

  def initialize(board, player_one, player_two)
    @board      = board
    @player_one = player_one
    @player_two = player_two
  end

  def start
    @started = true
    @board.reset
  end

  def stop
    @started = false
  end

  def play
    return if !started?

    if @player_one.move(@board)
      @forbidden_move = false
      switch_players
    else
      @forbidden_move = true
    end
    stop if state != State::PLAYING && state != State::FORBIDDEN_MOVE
    return state
  end

  def state
    return State::X_SYMBOL_WIN    if @board.win?(Parameters::X_SYMBOL)
    return State::O_SYMBOL_WIN    if @board.win?(Parameters::O_SYMBOL)
    return State::DRAW            if @board.draw?
    return State::NOT_STARTED     if !started?
    return State::FORBIDDEN_MOVE  if forbidden_move?
    return State::PLAYING
  end

  def switch_players
    temp        = @player_one
    @player_one = @player_two
    @player_two = temp
  end
end
