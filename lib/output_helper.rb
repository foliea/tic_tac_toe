module OutputHelper
  extend self

  def print_square(board, location)
    board[location] || '.'
  end

  def print_board(board)
    puts " #{print_square(board, 0)} | #{print_square(board, 1)} | #{print_square(board, 2)}\n" +
         "-----------\n" +
         " #{print_square(board, 3)} | #{print_square(board, 4)} | #{print_square(board, 5)}\n" +
         "-----------\n" +
         " #{print_square(board, 6)} | #{print_square(board, 7)} | #{print_square(board, 8)}\n"
  end

  def print_status(status)
    case status
    when GameStatus::NOT_STARTED
      puts "-- Error: Game not started --"
    when GameStatus::SQUARE_NOT_AVAILABLE
      puts "-- Error: Square not available --"      
    when GameStatus::OVER
      puts "-- Game Over --"
    end
  end

  def print_start(board)
    system('clear')
    puts "-- New Game Started --"
    print_board(board.to_a)
  end


  def print_game(board)
    system('clear')
    puts "----------------------"
    print_board(board.to_a)
  end

end
