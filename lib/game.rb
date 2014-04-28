class Game
  attr_reader :started, :board

  alias :started? :started

  def initialize(player_one, player_two)
    @board      = Board.new
    @player_one = player_one
    @player_two = player_two
  end

  def start
    @started = true
    @board.reset
    symbols = get_symbols

    @player_one.symbol = symbols.first
    @player_two.symbol = symbols.last
    
    @current_player = player_two_first? ? @player_two : @player_one
    @other_player = @current_player == @player_one ? @player_two : @player_one
  end

  def stop
    @started = false
  end

  def play
    return ReturnCodes::GAME_NOT_STARTED unless started?
    #return ReturnCodes::SQUARE_NOT_AVAILABLE unless @board.move_available?(location)
    
    @current_player.move(@board, @other_player.symbol)
    swap_players
    stop if over?
  end
  
  def over?
    @board.winner? || @board.draw?
  end
  
  private

  def swap_players
    temp = @current_player
    @current_player = @other_player
    @other_player = temp
  end
  
  def player_two_first?
    Random.rand(0..1) == 0
  end
  
  def get_symbols
    player_two_first? ? [Board::X_SYMBOL, Board::O_SYMBOL] : [Board::O_SYMBOL, Board::X_SYMBOL]
  end
end
