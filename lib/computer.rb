class Computer < Player
  def move board
    super(board, find_move(board))
  end

  private

  def find_move board
    get_win(board, @symbol)            ||
    block_win(board, @ennemy_symbol)   ||
    get_fork(board, @symbol)           ||
    block_fork(board, @ennemy_symbol)  ||
    center(board)                      ||
    opposite_corner(board)             ||
    empty_square(board)
  end

  def get_win board, symbol
    squares = detect_wins(board, symbol)
    squares.first
  end

  alias :block_win :get_win

  def detect_wins board, symbol
    wins = []
    board.empty_squares.each do |location|
      board.move(location, symbol)
      wins << location if board.win?(symbol)
      board.move(location, nil)
    end
    wins
  end

  def get_fork board, symbol
    detect_fork(board, symbol)
  end

  alias :block_fork :get_fork

  def detect_fork board, symbol
    board.empty_squares.each do |location|
      board.move(location, symbol)
      wins = detect_wins(board, symbol)
      board.move(location, nil)
      return location if wins.size >= 2
    end
    nil
  end

  def center board
    board.center if board.move_available?(board.center)
  end

  def opposite_corner board
    square = nil
    board.opposite_corners.each do |c|
      if board.square_has_symbol?(board.corners.first, @ennemy_symbol)
        square = board.corners.last if board.move_available?(board.corners.last)
      end
    end
    square
  end

  def empty_square board
    square = nil
    board.corners.each { |corner| square ||= corner if board.move_available?(corner) }
    board.middles.each { |middle| square ||= middle if board.move_available?(middle) }
    square
  end

end
