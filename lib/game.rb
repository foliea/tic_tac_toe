class Game
  attr_reader :started
  attr_reader :board

  alias :started? :started

  def initialize
    @started = false
  end

  def start
    human_symbol = Random.rand(0..1) == 0 ? 'X' : 'O'
    computer_symbol = human_symbol == 'X' ? 'O' : 'X'

    @started   = true
    @board     = Board.new
    @human     = Player.new(@board, human_symbol, computer_symbol)
    @computer  = Computer.new(@board, computer_symbol, human_symbol)

    @computer.move if Random.rand(0..1) == 0
    { code: 0, message: "You are playing with '#{@human.symbol}'", symbol: @human.symbol }
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
    if @board.win?(symbol)
      return { code: 1, message: "'#{symbol}' win the game", symbol: symbol }
    end
    if @board.draw?
      return { code: 1, message: 'It\'s a draw' }
    end
    nil
  end
end
