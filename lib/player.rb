require_relative 'game_entity'

class Player < GameEntity
  def play(location)
    @board.tick(location, @symbol)
  end
end
