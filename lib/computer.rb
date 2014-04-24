class Computer < Player
  def move
    location = find_move
    super(location)
  end

  private

  def find_move
    get_win(@symbol)            ||
    block_win(@ennemy_symbol)   ||
    get_fork(@symbol)           ||
    block_fork(@ennemy_symbol)  ||
    center                      ||
    opposite_corner             ||
    empty_square
  end

  def get_win symbol
    squares = detect_wins(@board, symbol)
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

  def get_fork symbol
    detect_fork(symbol)
  end

  alias :block_fork :get_fork

  def detect_fork symbol
    @board.empty_squares.each do |location|
      @board.move(location, symbol)
      wins = detect_wins(@board, symbol)
      @board.move(location, nil)
      return location if wins.size >= 2
    end
    nil
  end

  def center
    4 if @board.move_available?(4)
  end

  def opposite_corner
    square = nil
    opposite_corners.each do |c|
      if @board.square_has_symbol?(corners.first, @ennemy_symbol)
        square = corners.last if @board.move_available?(corners.last)
      end
    end
    square
  end

  def empty_square
    square = nil
    corners.each { |corner| square ||= corner if @board.move_available?(corner) }
    middles.each { |middle| square ||= middle if @board.move_available?(middle) }
    square
  end

  def corners
    [0, 6, 2, 8]
  end

  def middles
    [1, 3, 5, 7]
  end

  def opposite_corners
    [ [0, 8], [2, 6], [6, 2], [8, 0] ]
  end
end
