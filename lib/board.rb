class Board
  SIZE = 3 * 3

  def initialize
    @grid = Array.new(SIZE)
  end

  def reset
    @grid.map! { nil }
  end

  def move(location, mark)
    @grid[location] = mark
  end

  def move_available?(location)
    location >= 0 && location <= 8 && @grid[location].nil?
  end

  def square_has_symbol?(location, symbol)
    @grid[location] == symbol ? true : false
  end

  def empty_squares
    squares = []
    @grid.each_index do |location|
      squares << location if move_available?(location)
    end
    squares
  end

  def winner?
    win?('X') || win?('O')
  end

  def draw?
    winner? || empty_squares.size > 0 ? false : true
  end

  def win?(symbol)
    winning_possibilities.each do |possibility|
      return true if possibility.all? do |index|
        @grid[index] == symbol
      end
    end
    false
  end

  def to_a
    @grid
  end

  def center
    4
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

  private

  def winning_possibilities
    [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[6,4,2]
    ]
  end
end
