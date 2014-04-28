module ConsoleDisplay
  extend self

  def ask_new_game
    puts '-- Do you want to start a new game ? [y/n] --'
    answer = gets.chomp.downcase
  end

  def ask_for_move
    puts '-- Please enter your move (between 1 and 9) : --'
    move = gets.chomp.to_i - 1
  end

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
    if status[:code] == ReturnCodes::GAME_NOT_STARTED ||
       status[:code] == ReturnCodes::SQUARE_NOT_AVAILABLE
      puts "-- Error: #{status[:message]} --"
    else
      puts "-- #{status[:message]} --\n"
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
