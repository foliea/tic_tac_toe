require 'player'

class Human < Player
  attr_accessor :symbol
  attr_reader :input
  
  def initialize symbol, input
    @input = input
    super(symbol)
  end

  def move(board)
    next_location = find_next_location
    super(board, next_location)
  end

  def find_next_location
    @input.ask_for_next_location
  end
end
