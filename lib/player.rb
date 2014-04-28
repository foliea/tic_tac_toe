class Player
  attr_accessor :symbol
  
  def initialize find_next_location
    @find_next_location = find_next_location
  end
  
  def move(board, ennemy_symbol)
    next_location = @find_next_location(board, ennemy_symbol)
    board.move(next_location, @symbol)
  end
  
end
