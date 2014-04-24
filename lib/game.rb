class Game
  def initialize
    @board = Board.new
    @symbol = randomize_symbol
    @opponent = Opponent.new(@board, @symbol)
  end

  def play(x, y)
    begin
      if @board.tick(x, y, @symbol)
        return 'You win'
      end

      if @board.empty_squares.size == 0
        return 'Draw'
      end

      if @opponent.play
        return 'Opponent win'
      end
    rescue Exception => e
      return e.message
    end
    print
  end

  def print
    @board.grid.each do |row|
      puts row.to_s
    end
  end

  private

  def randomize_symbol
    'X'
  end
end
