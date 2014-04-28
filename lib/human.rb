class Human < Player
  attr_accessor :symbol

  def initialize symbol, input
    @input = input
    super(symbol)
  end

  def move(board, ennemy_symbol)
    next_location = find_next_location
    board.move(next_location, @symbol)
  end

  def find_next_location
    @input.ask_for_next_location
  end
end
