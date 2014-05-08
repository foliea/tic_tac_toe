require 'params'

class Computer
  attr_reader :symbol, :opponent_symbol

  def initialize(symbol)
    @symbol = symbol
    @opponent_symbol = find_opponent_symbol
  end

  def move(board)
    best_move = find_best_move(board)
    board.move(best_move, @symbol)
  end

  def find_opponent_symbol
    (@symbol == Params::X_SYMBOL) ? Params::O_SYMBOL : Params::X_SYMBOL
  end

  def find_best_move(board)
    best_move, best_score = minimax(board, @symbol, @opponent_symbol)
    return best_move
  end

  private

  def minimax(board, symbol, opponent_symbol, alpha = -1.0/0.0, beta = 1.0/0.0, depth = 0)
    best_score = nil
    best_move  = nil
    depth +=1

    board.empty_squares.each do |location|
      board.move(location, symbol)

      if board.over?
        score = get_score(board) * max_depth(board) / depth
      else
        move_position, score = minimax(board, opponent_symbol, symbol, alpha, beta, depth)
      end

      if save_values?(symbol, score, best_score)
        best_score = score
        best_move  = location
      end

      alpha = best_score if !is_opponent?(symbol)
      beta  = best_score if  is_opponent?(symbol)
      
      board.undo_move(location)

      if alpha >= beta
        break
      end
    end

    return best_move, best_score
  end

  def is_opponent?(symbol)
    symbol == @opponent_symbol
  end

  def save_values?(symbol, score, best_score)
    return true if best_score.nil?

    if is_opponent?(symbol)
      score < best_score
    else
      score > best_score
    end
  end

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
