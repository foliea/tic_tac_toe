class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(Parameters::BOARD_SIZE, Parameters::BLANK_SYMBOL)
  end

  def reset
    @grid.map! { Parameters::BLANK_SYMBOL }
  end

  def move(location, mark)
    @grid[location] = mark #if move_available?(location)
  end

  def undo_move(location)
    @grid[location] = Parameters::BLANK_SYMBOL
  end

  def move_available?(location)
    location && location >= 0 && location < @grid.size && @grid[location] == Parameters::BLANK_SYMBOL
  end

  def square_has_symbol?(location, symbol)
    @grid[location] == symbol
  end

  def empty_squares
    squares = []
    @grid.each_index do |location|
      squares << location if move_available?(location)
    end
    squares
  end

  def draw?
    !win?(Parameters::X_SYMBOL) && !win?(Parameters::O_SYMBOL) && empty_squares.size <= 0
  end

  def win?(symbol)
    Parameters::WINNING_PATTERNS.each do |pattern|
      return true if pattern.all? { |index| @grid[index] == symbol }
    end
    false
  end

  def to_a
    @grid
  end

end
