class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9)
  end

  def tick(location, mark)
    if mark && (outside_grid?(location) || square(location))
      return nil
    end
    @grid[location] = mark
    return location
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

  def win?(mark)
    # Row
    return true if @grid[0] == mark && @grid[1] == mark && @grid[2] == mark
    return true if @grid[3] == mark && @grid[4] == mark && @grid[5] == mark
    return true if @grid[6] == mark && @grid[7] == mark && @grid[8] == mark
    # Column
    return true if @grid[0] == mark && @grid[3] == mark && @grid[6] == mark
    return true if @grid[1] == mark && @grid[4] == mark && @grid[7] == mark
    return true if @grid[2] == mark && @grid[5] == mark && @grid[8] == mark
    # Diagonale
    return true if @grid[0] == mark && @grid[4] == mark && @grid[8] == mark
    return true if @grid[6] == mark && @grid[4] == mark && @grid[2] == mark
    return false
  end

  def draw?
    empty_squares.size <= 0 ? true : false
  end

  def to_a
    @grid
  end

  private

  def outside_grid?(location)
    location < 0 || location > 8
  end
end
