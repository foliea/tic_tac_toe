class Computer
  attr_accessor :symbol
  
  def move(board, ennemy_symbol)
    next_location = find_next_location(board, ennemy_symbol)
    board.move(next_location, @symbol)
  end
  
  private
  
  def find_next_location(board, ennemy_symbol)
    get_win(board, @symbol)            ||
    block_win(board, ennemy_symbol)   ||
    get_fork(board, @symbol)           ||
    block_fork(board, ennemy_symbol)  ||
    center(board)                      ||
    opposite_corner(board)             ||
    empty_square(board)
  end
 
  def get_win(board, symbol)
    squares = get_wins_location(board, symbol)
    squares.first
  end

  alias :block_win :get_win

  def get_wins_location(board, symbol)
    wins = []
    board.empty_squares.each do |location|
      board.move(location, symbol)
      wins << location if board.win?(symbol)
      board.undo_move(location)
    end
    wins
  end

  def get_fork(board, symbol)
    get_fork_location(board, symbol)
  end

  alias :block_fork :get_fork

  def get_fork_location(board, symbol)
    board.empty_squares.each do |location|
      board.move(location, symbol)
      wins = get_wins_location(board, symbol)
      board.undo_move(location)
      return location if wins.size >= 2
    end
    nil
  end

  def center(board)
    board.center if board.move_available?(board.center)
  end

  def opposite_corner(board)
    board.opposite_corners.each do |c|
      if board.square_has_symbol?(board.corners.first, @ennemy_symbol)
        return board.corners.last if board.move_available?(board.corners.last)
      end
    end
    nil
  end

  def empty_square(board)
    square = nil
    board.corners.each { |corner| square ||= corner if board.move_available?(corner) }
    board.middles.each { |middle| square ||= middle if board.move_available?(middle) }
    square
  end

end
