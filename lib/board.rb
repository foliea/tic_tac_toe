class Board
  GRID_SIZE = 3 * 3

  def initialize
    @grid = Array.new(GRID_SIZE)
    winning_possibilities
  end

  def reset
    @grid.map! { nil }
  end

  def move(location, mark)
    @grid[location] = mark
  end

  def move_available?(location)
    location >= 0 && location <= 8 && square(location).nil?
  end

  def square(location)
    @grid[location]
  end

  def empty_squares
    squares = []
    @grid.each_index do |location|
      squares << location unless square(location)
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
    @possibilities.each do |possibility|
      return true if possibility.all? do |index|
        @grid[index] == symbol
      end
    end
    false
  end
  
  def to_a
    @grid
  end

  private

  def winning_possibilities
    @possibilities = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[6,4,2]
    ]
  end
end
