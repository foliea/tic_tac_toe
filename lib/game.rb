class Game
  def initialize
    @symbol = 'X'
  end

  def start
    @board = Board.new
    @opponent = Opponent.new(@board, @symbol)

    if Random.rand(0..1) == 0
      @opponent.play
    end
  end

  def play(location)
    begin
      if @board.tick(location, @symbol)
        return 'You win'
      end

      if @board.empty_squares.size == 0
        return 'Draw'
      end

      if @opponent.play
        return 'Opponent win'
      end

      if @board.empty_squares.size == 0
        return 'Draw'
      end
    rescue Exception => e
      return e.message
    end
  end

  def get_board
    @board.grid
  end

end
