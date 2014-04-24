class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def tick(x, y, mark)
    if mark
      raise 'Forbidden move' if outside_grid?(x, y)
      raise 'square not empty'  if square_ticked?(x, y)
    end
    @grid[y][x] = mark
    win?(x, y, mark)
  end

  def empty_squares
    squares = []
    @grid.each do |row|
      y = @grid.find_index(row)
      row.each_index do |x|
        squares << [x, y] unless square_ticked?(x, y)
      end
    end
    squares
  end

  def win?(x, y, mark)
    diagonal = (0..2).map { |index| @grid[index][index] }

    return true if @grid[y].all? { |square| square == mark }
    return true if @grid.all? { |row| row[x] == mark }
    return true if diagonal.all? { |square| square == mark }
    return true if mark == @grid[2][0] && mark == @grid[1][1] && mark == @grid[0][2]
  end

  def square_ticked?(x, y)
    @grid[y][x]
  end

  private

  def outside_grid?(x, y)
    x < 0 || x > 2 || y < 0 || y > 2
  end
end
