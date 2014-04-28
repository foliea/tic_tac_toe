module ConsoleDisplay
  extend self

  def ask_new_game
    puts '-- Do you want to start a new game ? [y/n] --'
    new_game = gets.chomp.downcase
  end

  def ask_for_move
    puts '-- Please enter your move (between 1 and 9) : --'
    move = gets.chomp.to_i - 1
  end

  def display_square(board, location)
    board[location] || '.'
  end

  def display_board(board)
    puts " #{display_square(board, 0)} | #{display_square(board, 1)} | #{display_square(board, 2)}\n" +
         "-----------\n" +
         " #{display_square(board, 3)} | #{display_square(board, 4)} | #{display_square(board, 5)}\n" +
         "-----------\n" +
         " #{display_square(board, 6)} | #{display_square(board, 7)} | #{display_square(board, 8)}\n"
  end

  def display_status(status)
    if status[:code] == ReturnCodes::GAME_NOT_STARTED ||
       status[:code] == ReturnCodes::SQUARE_NOT_AVAILABLE
      puts "-- Error: #{status[:message]} --"
    else
      puts "-- #{status[:message]} --\n"
    end
  end

  def display_start(board)
    system('clear')
    puts "-- New Game Started --"
    display_board(board.to_a)
  end


  def display_game(board)
    system('clear')
    puts "----------------------"
    display_board(board.to_a)
  end

end
