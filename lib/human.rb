class Human
  attr_reader :symbol

  def initialize(symbol, input)
    @symbol = symbol
    @input  = input
  end

  def move(board)
    next_location = find_next_location
    board.move(next_location, @symbol)
  end

  def find_next_location
    @input.ask_for_next_location - 1
  end
end
