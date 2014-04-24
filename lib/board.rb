require 'pry'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9)
  end

  def tick(location, mark)
    if mark
      raise 'Forbidden move' if outside_grid?(location)
      raise 'square not empty'  if square(location)
    end
    @grid[location] = mark
    win?(location, mark)
  end

  def empty_squares
    squares = []
    @grid.each_index do |location|
      squares << location unless square(location)
    end
    squares
  end

  def win?(location, mark)
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
  end

  def square(location)
    @grid[location]
  end

  private

  def outside_grid?(location)
    location < 0 || location > 8
  end
end
