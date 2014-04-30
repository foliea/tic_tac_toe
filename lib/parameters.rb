module Parameters

  X_SYMBOL = 'X'.freeze
  O_SYMBOL = 'O'.freeze
  BLANK_SYMBOL = nil.freeze

  BOARD_SIZE = 3 * 3

  CENTER = 4.freeze
  CORNERS = [0, 6, 2, 8].freeze
  MIDDLES = [1, 3, 5, 7].freeze
  OPPOSITE_CORNERS = [ [0, 8], [2, 6], [6, 2], [8, 0] ].freeze

  WINNING_PATTERNS =
  [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ].freeze

  GAME_NOT_FINISH = 0.freeze
  DRAW = -1.freeze
  X_SYMBOL_WIN = 1.freeze
  O_SYMBOL_WIN = 2.freeze
end
