class Game
  attr_reader :started

  alias :started? :started

  def initialize
    @started = false
  end

  def start
    human_symbol = Random.rand(0..1) == 0 ? 'X' : 'O'
    computer_symbol = human_symbol == 'X' ? 'O' : 'X'

    @started = true
    @board = Board.new
    @human = Human.new(@board, human_symbol, computer_symbol)
    @computer = Computer.new(@board, computer_symbol, human_symbol)

    @computer.play if Random.rand(0..1) == 0
    return { code: 0, message: "You are playing with '#{@human.symbol}'", symbol: @human.symbol }
  end

  def play(location)

    if !started?
      return { code: -1, message: 'You need to start a game first' }
    end
    unless @human.play(location)
      return { code: -1, message: "This square isn't empty" }
    end
    if status = detect_end(@human.symbol)
      @started = false
      return status
    end
    @computer.play
    if status = detect_end(@computer.symbol)
      @started = false
      return status
    end
    return { code: 0 }
  end

  def get_display
    @board.to_a
  end

  private

  def detect_end(symbol)
    if @board.win?(symbol)
      return { code: 1, message: "'#{symbol}' win the game", symbol: symbol }
    end
    if @board.draw?
      return { code: 1, message: 'It\'s a draw' }
    end
    return nil
  end
end
