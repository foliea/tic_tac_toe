require_relative 'human'

class Computer < Player
  def play
    move = win(@symbol) || block_win(@ennemy_symbol) ||
           do_fork(@symbol) || block_fork(@ennemy_symbol) ||
           center || opposite_corner || empty_square
    @board.tick(move, @symbol) if move
  end
  
  private
  
  def win symbol
    squares = detect_wins(@board, symbol)
    squares.first
  end
  
  alias :block_win :win
  
  def detect_wins board, symbol
    wins = []
    board.empty_squares.each do |location|
      board.tick(location, symbol)
      wins << location if board.win?(symbol)
      board.tick(location, nil)
    end
    wins
  end
  
  def do_fork symbol
    detect_fork(symbol)
  end
  
  alias :block_fork :do_fork
  
  def detect_fork symbol
    @board.empty_squares.each do |location|
      @board.tick(location, symbol)
      wins = detect_wins(@board, symbol)
      @board.tick(location, nil)
      return location if wins.size >= 2
    end
    nil
  end
  
  def center
    4 unless @board.square(4)
  end
  
  def opposite_corner
    if @board.square(8) == @ennemy_symbol
      square ||= 0 unless @board.square(0)
    end
    if @board.square(2) == @ennemy_symbol
      square ||= 6 unless @board.square(6)
    end
    if @board.square(6) == @ennemy_symbol
      square ||= 2 unless @board.square(2)
    end
    if @board.square(0) == @ennemy_symbol
      square ||= 8 unless @board.square(8)
    end
    square
  end
  
  def empty_square
    # empty corner
    square ||= 0 unless @board.square(0)
    square ||= 6 unless @board.square(6)
    square ||= 2 unless @board.square(2)
    square ||= 8 unless @board.square(8)
    
    # empty side
    square ||= 1 unless @board.square(1)
    square ||= 3 unless @board.square(3)
    square ||= 5 unless @board.square(5)
    square ||= 7 unless @board.square(7)
  end
end
