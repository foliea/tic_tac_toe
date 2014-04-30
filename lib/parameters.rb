module Parameters
  extend self

  BOARD_SIZE = 3 * 3
  X_SYMBOL = 'X'.freeze
  O_SYMBOL = 'O'.freeze
  BLANK_SYMBOL = nil

  def center
    4
  end

  def corners
    [0, 6, 2, 8]
  end

  def middles
    [1, 3, 5, 7]
  end

  def opposite_corners
    [ [0, 8], [2, 6], [6, 2], [8, 0] ]
  end

  def winning_patterns
    [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[6,4,2]
    ]
  end
end
