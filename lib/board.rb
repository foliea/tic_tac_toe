class Board
  attr_accessor :grid
  attr_reader :size

  def initialize(size)
    @size = size
    @grid = Array.new(@size ** 2, Parameters::BLANK_SYMBOL)
    set_winning_patterns
  end

  def reset
    @grid.map! { Parameters::BLANK_SYMBOL }
  end

  def move(location, mark)
    @grid[location] = mark if move_available?(location)
  end

  def undo_move(location)
    @grid[location] = Parameters::BLANK_SYMBOL
  end

  def move_available?(location)
    location >= 0 && location < @grid.size && @grid[location] == Parameters::BLANK_SYMBOL
  end

  def square_has_symbol?(location, symbol)
    @grid[location] == symbol
  end

  def empty_squares
    squares = Array.new
    @grid.each_index do |location|
      squares << location if move_available?(location)
    end
    squares
  end

  def draw?
    !win?(Parameters::X_SYMBOL) && !win?(Parameters::O_SYMBOL) && empty_squares.size <= 0
  end

  def win?(symbol)
    @winning_patterns.each do |pattern|
      return true if pattern.all? { |index| @grid[index] == symbol }
    end
    false
  end

  def set_winning_patterns
    @winning_patterns = Array.new

    diagonale_1 = Array.new
    diagonale_2 = Array.new

    @size.times do |i|
      row = Array.new
      column = Array.new
      @size.times do |j|
        row    << i * @size + j
        column << j * @size + i
      end
      diagonale_1 << (i)     * (@size + 1)
      diagonale_2 << (i + 1) * (@size - 1)
      @winning_patterns << row
      @winning_patterns << column
    end
    @winning_patterns << diagonale_1
    @winning_patterns << diagonale_2
  end

end
