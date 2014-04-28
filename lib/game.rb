class Game
  attr_reader :started
  attr_reader :board

  alias :started? :started

  def initialize
    @board     = Board.new
    @human     = Player.new
    @computer  = Computer.new
  end

  def start
    symbols = get_symbols

    @started = true
    @board.reset
    @human.set_symbols(symbols.first, symbols.last)
    @computer.set_symbols(symbols.last, symbols.first)
    @computer.move(@board) if computer_first?
    { code: ReturnCodes::NEW_GAME, message: "You are playing with '#{@human.symbol}'", symbol: @human.symbol }
  end

  def stop
    @started = false
  end

  def play(location)

    if !started?
      return { code: ReturnCodes::GAME_NOT_STARTED, message: 'You need to start a game first' }
    end

    if @board.move_available?(location)
      @human.move(@board, location)
    else
      return { code: ReturnCodes::SQUARE_NOT_AVAILABLE, message: "This square isn't available" }
    end

    if status = detect_end(@human.symbol)
      stop
      return status
    end
    @computer.move(@board)
    if status = detect_end(@computer.symbol)
      stop
      return status
    end
    { code: 0 }
  end

  private

  def detect_end(symbol)
    if @board.winner?
      return { code: ReturnCodes::WIN, message: "'#{symbol}' win the game", symbol: symbol }
    end
    if @board.draw?
      return { code: ReturnCodes::DRAW, message: 'It\'s a draw' }
    end
    nil
  end

  def computer_first?
    Random.rand(0..1) == 0
  end

  def get_symbols
    Random.rand(0..1) == 0 ? ['X','O'] : ['O','X']
  end

end
