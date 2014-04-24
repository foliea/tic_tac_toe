class Opponent
  def initialize board, ennemy_symbol
    @board = board
    @symbol = (ennemy_symbol == 'X') ? 'O' : 'X'
    @ennemy_symbol = ennemy_symbol
  end

  def play
    move = win || block_win || do_fork || block_fork || center || opposite_corner || empty_square
    @board.tick(move[:x], move[:y], @symbol)
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
    board.empty_squares.each do |x, y|
      board.tick(x, y, symbol)
      squares << { x: x, y: y } if board.win?(x, y, symbol)
      board.tick(x, y, nil)
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
    @board.empty_squares.each do |x, y|
      @board.tick(x, y, symbol)
      squares = detect_win(@board, symbol)
      @board.tick(x, y, nil)
      return { x: x, y: y } if squares.size >= 2
    end
    nil
  end

  def center
    { x: 1, y: 1 }  unless @board.square_ticked?(1, 1)
  end

  def opposite_corner
    if @board.square_ticked?(2, 2) == @ennemy_symbol
      square ||= { x: 0, y: 0 } unless @board.square_ticked?(0, 0)
    end
    if @board.square_ticked?(2, 0) == @ennemy_symbol
      square ||= { x: 0, y: 2 } unless @board.square_ticked?(0, 2)
    end
    if @board.square_ticked?(0, 2) == @ennemy_symbol
      square ||= { x: 2, y: 0 } unless @board.square_ticked?(2, 0)
    end
    if @board.square_ticked?(0, 0) == @ennemy_symbol
      square ||= { x: 2, y: 2 } unless @board.square_ticked?(2, 2)
    end
    square
  end

  def empty_square
    # empty corner
    square ||= { x: 0, y: 0 } unless @board.square_ticked?(0, 0)
    square ||= { x: 0, y: 2 } unless @board.square_ticked?(0, 2)
    square ||= { x: 2, y: 0 } unless @board.square_ticked?(2, 0)
    square ||= { x: 2, y: 2 } unless @board.square_ticked?(2, 2)

    # empty side
    square ||= { x: 0, y: 1 } unless @board.square_ticked?(0, 1)
    square ||= { x: 1, y: 0 } unless @board.square_ticked?(1, 0)
    square ||= { x: 2, y: 1 } unless @board.square_ticked?(2, 1)
    square ||= { x: 1, y: 2 } unless @board.square_ticked?(1, 2)

    square
  end
end
