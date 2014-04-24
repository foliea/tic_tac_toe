class Opponent
  def initialize board, ennemy_symbol
    @board = board
    @symbol = (ennemy_symbol == 'X') ? 'O' : 'X'
    @ennemy_symbol = ennemy_symbol
  end

  def play
    move = win || block_win || do_fork || block_fork || center || opposite_corner || empty_square
    @board.tick(move, @symbol)
  end

  private

  def win
    squares = detect_win(@board, @symbol)
    squares[0]
  end

  def block_win
    squares = detect_win(@board, @ennemy_symbol)
    squares[0]
  end

  def detect_win board, symbol
    squares = []
    board.empty_squares.each do |location|
      board.tick(location, symbol)
      squares << location if board.win?(location, symbol)
      board.tick(location, nil)
    end
    return squares
  end

  def do_fork
    detect_fork(@symbol)
  end

  def block_fork
    detect_fork(@ennemy_symbol)
  end

  def detect_fork symbol
    @board.empty_squares.each do |location|
      @board.tick(location, symbol)
      squares = detect_win(@board, symbol)
      @board.tick(location, nil)
      return location if squares.size >= 2
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
