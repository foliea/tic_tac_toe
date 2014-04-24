class GameEntity
  attr_reader :symbol
  
  def initialize(board, symbol, ennemy_symbol)
    @board = board
    @symbol = symbol
    @ennemy_symbol = ennemy_symbol
  end
end