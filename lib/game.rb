class Game
  attr_reader :status
  
  def start
    human_symbol = Random.rand(0..1) == 0 ? 'X' : 'O'
    computer_symbol = human_symbol == 'X' ? 'O' : 'X'
    
    @board = Board.new
    @human = Human.new(@board, human_symbol, computer_symbol)
    @computer = Computer.new(@board, computer_symbol, human_symbol)
    
    @computer.play if Random.rand(0..1) == 0
    return { status: 0, message: "You are playing with '#{@human.symbol}'", symbol: @human.symbol }
  end
  
  def play(location)
    move = @human.play(location)
    if move.nil?
      return { status: -1, message: "You can't tick square in #{location}" }
    end
    if status = detect_end(@human.symbol)
      return status
    end
    @computer.play
    if status = detect_end(@computer.symbol) 
      return status
    end
    return { status: 0, message: "You ticked square in #{location} with success" }
  end

  def get_display
    @board.grid
  end

  private
  
  def detect_end(symbol)
    if @board.win?(symbol)
      return { status: 1, message: "'#{symbol}' win the game", symbol: symbol }
    end
    if @board.draw?
      return { status: 1, message: 'It\'s a draw' }
    end
    return nil
  end  
end
