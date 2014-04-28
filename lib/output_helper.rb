module OutputHelper
  extend self

  def print_square(board, location)
    board[location] || '.'
  end

  def print_board(board, output_stream = $stdout)
    output_stream.puts " #{print_square(board, 0)} | #{print_square(board, 1)} | #{print_square(board, 2)}\n" +
         "-----------\n" +
         " #{print_square(board, 3)} | #{print_square(board, 4)} | #{print_square(board, 5)}\n" +
         "-----------\n" +
         " #{print_square(board, 6)} | #{print_square(board, 7)} | #{print_square(board, 8)}\n"
  end

  def print_status(status, output_stream = $stdout)
    case status
    when GameStatus::NOT_STARTED
      output_stream.puts "-- Error: Game not started --"
    when GameStatus::SQUARE_NOT_AVAILABLE
      output_stream.puts "-- Error: Square not available --"
    when GameStatus::OVER
      output_stream.puts "-- Game Over --"
    end
  end

  def print_start(board, output_stream = $stdout)
    system('clear')
    output_stream.puts "-- New Game Started --"
    print_board(board.to_a)
  end


  def print_game(board, output_stream = $stdout)
    system('clear')
    output_stream.puts "----------------------"
    print_board(board.to_a)
  end

end
