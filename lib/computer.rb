require 'player'

class Computer < Player
  attr_accessor :symbol

  def move(board)
    @ennemy_symbol = find_ennemy_symbol
    minimax(board, @symbol, @ennemy_symbol)
    super(board, @choice)
  end

  def find_ennemy_symbol
    (@symbol == Parameters::X_SYMBOL) ? Parameters::O_SYMBOL : Parameters::X_SYMBOL
  end

  def find_next_location(board, ennemy_symbol)
    get_win(board, @symbol)               ||
    block_win(board, ennemy_symbol)       ||
    get_fork(board, @symbol)              ||
    block_fork(board, ennemy_symbol)      ||
    center(board)                         ||
    opposite_corner(board, ennemy_symbol) ||
    empty_square(board)
  end

  private
  
  def score(board, depth)
    if board.win?(@symbol)
      return 10 - depth
    elsif board.win?(@ennemy_symbol)
      return depth -10
    else
      return 0
    end
  end
  
  def minimax(board, symbol, ennemy_symbol, depth = 0)
    return score(board, depth) if board.draw? || board.win?(@symbol) || board.win?(@ennemy_symbol)
    scores = Array.new
    moves  = Array.new
    depth += 1
    
    board.empty_squares.each do |move|
        possible_board = board.dup
        possible_board.grid = board.grid.dup
        # move to board.get_deep_copy
        possible_board.move(move, symbol)
        OutputHelper.print_board(possible_board)
        scores.push minimax(possible_board, ennemy_symbol, symbol, depth)
        moves.push move
    end

    if symbol == @symbol
        max_score_index = scores.each_with_index.max[1]
        @choice = moves[max_score_index]
        return scores[max_score_index]
    else
        min_score_index = scores.each_with_index.min[1]
        @choice = moves[min_score_index]
        return scores[min_score_index]
    end
  end

  def get_win(board, symbol)
    get_wins_location(board, symbol).first
  end

  alias :block_win :get_win

  def get_wins_location(board, symbol)
    wins = Array.new
    board.empty_squares.each do |location|
      if try_move(board, location, symbol) { board.win?(symbol) }      
        wins << location
      end
    end
    wins
  end

  def get_fork(board, symbol)
    get_fork_location(board, symbol)
  end

  alias :block_fork :get_fork

  def get_fork_location(board, symbol)
    board.empty_squares.each do |location|
      if try_move(board, location, symbol) { get_wins_location(board, symbol).size >=  2 }
        return location
      end
    end
    nil
  end
  
  def try_move(board, location, symbol, &block)
    board.move(location, symbol)
    res = block.call
    board.undo_move(location)
    return res
  end

  def center(board)
    Shapes::CENTER if board.move_available?(Shapes::CENTER)
  end

  def opposite_corner(board, ennemy_symbol)
    Shapes::OPPOSITE_CORNERS.each do |corner_1, corner_2|
      if board.square_has_symbol?(corner_1, ennemy_symbol) &&
         board.move_available?(corner_2)
        return corner_2
      end
    end
    nil
  end

  def empty_square(board)
    Shapes::CORNERS.each { |corner| return corner if board.move_available?(corner) }
    Shapes::MIDDLES.each { |middle| return middle if board.move_available?(middle) }
    nil
  end

end
