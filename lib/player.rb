class Player
  attr_reader :symbol

  def initialize(symbol, ennemy_symbol)
    @symbol        = symbol
    @ennemy_symbol = ennemy_symbol
  end

  def move(board, location = nil)
    board.move(location, @symbol) if location
  end
end
