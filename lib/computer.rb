require 'player'

class Computer < Player
  attr_accessor :symbol, :opponent_symbol

  def initialize(symbol)
    super(symbol)
    @opponent_symbol = find_opponent_symbol
  end

  def move(board)
    best_move, best_score = minimax(board, @symbol, @opponent_symbol)
    super(board, best_move)
  end

  def find_opponent_symbol
    (@symbol == Params::X_SYMBOL) ? Params::O_SYMBOL : Params::X_SYMBOL
  end

  def minimax(board, symbol, opponent_symbol, alpha = -1.0/0.0, beta = 1.0/0.0, depth = 0)
    best_score = nil
    best_move  = nil
    depth +=1

    board.empty_squares.each do |location|
      board.move(location, symbol)

      if board.draw? || board.win?(@symbol) || board.win?(@opponent_symbol)
        score = get_score(board) * max_depth(board) / depth
      else
        move_position, score = minimax(board, opponent_symbol, symbol, alpha, beta, depth)
      end

      if symbol == @symbol &&
        (best_score == nil || score > best_score)
          best_score = alpha = score
          best_move = location
      end
      if symbol == @opponent_symbol &&
        (best_score == nil || score < best_score)
          best_score = beta = score
          best_move = location
      end

      board.undo_move(location)

      if alpha >= beta
        break
      end
    end

    return best_move, best_score
  end

  private

  def get_score(board)
    if board.win?(@symbol)
      return 1
    elsif board.win?(@opponent_symbol)
      return -1
    else
      return 0
    end
  end

  def max_depth(board)
    board.size / 2
  end
end
