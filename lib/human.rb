class Human
  attr_accessor :symbol
  
  def initialize input
    @input = input
  end
  
  def move(board, ennemy_symbol)
    next_location = find_next_location
    board.move(next_location, @symbol)
  end
  
  def find_next_location
    @input.ask_for_next_location
  end
end
