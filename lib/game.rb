class Game
  attr_reader :status
  
  def start
    @player_symbol = Random.rand(0..1) == 0 ? 'X' : '0'
    @board = Board.new
    @computer = Computer.new(@board, @player_symbol)
    
    @computer.play if Random.rand(0..1) == 0
    
    return { status: 0, message: "You are playing with '#{@player_symbol}'", symbol: @player_symbol }
  end
  
  def play(location)
      if @board.tick(location, @player_symbol).nil?
        return { status: -1, message: "You can't tick square in #{location}" }
      end
      if status = detect_end(@player_symbol)
        return status
      end
      computer_move = @computer.play
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
