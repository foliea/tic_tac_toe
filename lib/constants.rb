module Parameters

  X_SYMBOL = 'X'.freeze
  O_SYMBOL = 'O'.freeze
  BLANK_SYMBOL = nil.freeze

  BOARD_SIZE = 4

end

module Shapes
  CENTER = 4.freeze
  CORNERS = [0, 6, 2, 8].freeze
  MIDDLES = [1, 3, 5, 7].freeze
  OPPOSITE_CORNERS = [ [0, 8], [2, 6], [6, 2], [8, 0] ].freeze
end

module State
  PLAYING = 0.freeze
  NOT_STARTED = 1.freeze
  X_SYMBOL_WIN = 2.freeze
  O_SYMBOL_WIN = 3.freeze
  DRAW = 4.freeze
  FORBIDDEN_MOVE = -1.freeze
end
