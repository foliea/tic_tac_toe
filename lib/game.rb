class Game
  attr_reader :started
  attr_reader :board

  alias :started? :started

  def initialize
    @started   = false
    @board     = Board.new
  end

  def start
    board.reset
    symbols = assign_symbols

    @started   = true
    @human     = Player.new(@board, symbols.first, symbols.last)
    @computer  = Computer.new(@board, symbols.last, symbols.first)

    @computer.move if Random.rand(0..1) == 0
    { code: 0, message: "You are playing with '#{@human.symbol}'", symbol: @human.symbol }
  end

  def stop
    @started = false
  end

  def play(location)

    if !started?
      return { code: -1, message: 'You need to start a game first' }
    end

    if @board.move_available?(location)
      @human.move(location)
    else
      return { code: -1, message: "This square isn't empty" }
    end

    if status = detect_end(@human.symbol)
      @started = false
      return status
    end
    @computer.move
    if status = detect_end(@computer.symbol)
      @started = false
      return status
    end
    { code: 0 }
  end

  private

  def detect_end(symbol)
    if @board.winner?
      return { code: 1, message: "'#{symbol}' win the game", symbol: symbol }
    end
    if @board.draw?
      return { code: 1, message: 'It\'s a draw' }
    end
    nil
  end

  def assign_symbols
    Random.rand(0..1) == 0 ? ['X','O'] : ['O','X']
  end

end
