require_relative 'player'

class Human < Player
  def play(location)
    @board.tick(location, @symbol)
  end
end
