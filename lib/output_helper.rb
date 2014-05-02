module OutputHelper
  extend self

  def print_state(state, output = $stdout)
    case state
    when State::X_SYMBOL_WIN
      output.puts "#{Parameters::X_SYMBOL} wins !"
    when State::O_SYMBOL_WIN
      output.puts "#{Parameters::O_SYMBOL} wins !"
    when State::DRAW
      output.puts "It's a draw !"
    when State::FORBIDDEN_MOVE
      output.puts "Forbidden move !"
    end
  end

  def print_board(board, output = $stdout)
    system('clear')
    board.grid.each_slice(Parameters::BOARD_SIZE) do |row|
      row.each { |square| output.print "| #{square || '.'} |" }
      output.puts
      (0..5 * Parameters::BOARD_SIZE - 1).each { output.print '-' }
      output.puts
    end
  end
end
