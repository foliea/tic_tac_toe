class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def move(board, location)
    board.move(location, @symbol)
  end
end
