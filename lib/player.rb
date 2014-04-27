class Player
  attr_reader :symbol
  attr_reader :ennemy_symbol

  def set_symbols(symbol, ennemy_symbol)
    @symbol        = symbol
    @ennemy_symbol = ennemy_symbol
  end

  def move(board, location = nil)
    board.move(location, @symbol) if location
  end

end
