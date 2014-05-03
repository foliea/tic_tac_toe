require 'player'

class Computer < Player
  attr_accessor :symbol

  def move(board)
    @ennemy_symbol = find_ennemy_symbol

    best_move, best_score = minimax(board, @symbol, @ennemy_symbol)

    super(board, best_move)
  end

  def find_ennemy_symbol
    (@symbol == Parameters::X_SYMBOL) ? Parameters::O_SYMBOL : Parameters::X_SYMBOL
  end

  private

  def get_score(board)
    if board.win?(@symbol)
      return 1
    elsif board.win?(@ennemy_symbol)
      return -1
    else
      return 0
    end
  end

  def minimax(board, symbol, ennemy_symbol, alpha = -1.0/0.0, beta = 1.0/0.0)
    best_score = nil
    best_move  = nil

    board.empty_squares.each do |location|
      board.move(location, symbol)

      if board.draw? || board.win?(@symbol) || board.win?(@ennemy_symbol)
        score = get_score(board)
      else
        move_position, score = minimax(board, ennemy_symbol, symbol, alpha, beta, depth)
      end

      if symbol == @symbol
        if best_score == nil || score > best_score
          best_score = alpha = score
          best_move = location
        end
      else
        if best_score == nil || score < best_score
          best_score = beta = score
          best_move = location
        end
      end

      board.undo_move(location)

      if alpha >= beta
        break
      end
    end

    return best_move, best_score
  end

end
