require 'params'

class Board
  attr_reader :size

  def initialize(size)
    @size = size
    @grid = Array.new(@size**2, Params::BLANK_SYMBOL)
    @winning_patterns = winning_patterns
  end

  def reset
    @grid.map! { Params::BLANK_SYMBOL }
  end

  def move(location, mark)
    @grid[location] = mark if move_available?(location)
  end

  def undo_move(location)
    @grid[location] = Params::BLANK_SYMBOL
  end

  def move_available?(location)
    location >= 0 &&
    location < @grid.size &&
    @grid[location] == Params::BLANK_SYMBOL
  end

  def square_has_symbol?(location, symbol)
    @grid[location] == symbol
  end

  def empty_squares
    @grid.each_index.select { |i| move_available?(i) } || Array.new
  end

  def draw?
    !win?(Params::X_SYMBOL) &&
    !win?(Params::O_SYMBOL) &&
    empty_squares.size <= 0
  end

  def win?(symbol)
    @winning_patterns.any? { |p| p.all? { |i| @grid[i] == symbol } }
  end

  def over?
    draw? || win?(Params::X_SYMBOL) || win?(Params::O_SYMBOL)
  end

  def set(scheme)
    @grid = scheme.gsub(' ',  '')
                  .gsub("\n", '')
                  .gsub('X', Params::X_SYMBOL)
                  .gsub('O', Params::O_SYMBOL)
                  .split(//)
    @grid.map! { |c| (c == '.' ? Params::BLANK_SYMBOL : c) }
  end

  def to_a
    @grid
  end

  private

  def winning_patterns
    winning_patterns = []

    @size.times do |i|
      row    = []
      column = []

      @size.times do |j|
        row    << i * @size + j
        column << j * @size + i
      end
      winning_patterns << row
      winning_patterns << column
    end
    winning_patterns.concat(winning_diagonales)
  end

  def winning_diagonales
    winning_diagonales = []
    diagonale_1        = []
    diagonale_2        = []

    @size.times do |i|
      diagonale_1 << i * (@size + 1)
      diagonale_2 << (i + 1) * (@size - 1)
    end
    winning_diagonales << diagonale_1
    winning_diagonales << diagonale_2
  end
end
