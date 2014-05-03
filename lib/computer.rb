require 'player'

class Computer < Player
  attr_accessor :symbol

  def move(board)
    @ennemy_symbol = find_ennemy_symbol

    best_move, best_score = maximized_move(board, @symbol, @ennemy_symbol)

    super(board, best_move)
  end

  def find_ennemy_symbol
    (@symbol == Parameters::X_SYMBOL) ? Parameters::O_SYMBOL : Parameters::X_SYMBOL
  end

  private

  def score(board)
    if board.win?(@symbol)
      return 10
    elsif board.win?(@ennemy_symbol)
      return -10
    else
      return 0
    end
  end

  def maximized_move(board, symbol, ennemy_symbol)
    best_score = nil
    best_move  = nil

    board.empty_squares.each do |location|
      board.move(location, symbol)

      if board.draw? || board.win?(@symbol) || board.win?(@ennemy_symbol)
        s = score(board)
      else
        move_position, s = minimized_move(board, symbol, ennemy_symbol)
      end

      if best_score == nil || s > best_score
        best_score = s
        best_move = location
      end

      board.undo_move(location)
    end

    return best_move, best_score
  end

  def minimized_move(board, symbol, ennemy_symbol)
    best_score = nil
    best_move  = nil

    board.empty_squares.each do |location|
      board.move(location, ennemy_symbol)

      if board.draw? || board.win?(@symbol) || board.win?(@ennemy_symbol)
        s = score(board)
      else
        move_position, s = maximized_move(board, symbol, ennemy_symbol)
      end

      if best_score == nil || s < best_score
        best_score = s
        best_move = location
      end

      board.undo_move(location)
    end

    return best_move, best_score
  end

end
