module OutputHelper
  extend self

  def print_state(state, output = $stdout)
    [
      [State::X_SYMBOL_WIN,   "#{Parameters::X_SYMBOL} wins !"],
      [State::O_SYMBOL_WIN,   "#{Parameters::O_SYMBOL} wins !"],
      [State::DRAW,           "It's a draw !"],
      [State::FORBIDDEN_MOVE, "Forbidden move !"]
    ].each { |s, msg| output.puts msg if state == s }
  end

  def print_board(board, output = $stdout)
    #system('clear')
    print_separator(board.size, output)
    board.grid.each_slice(board.size) do |row|
      row.each { |square| output.print "| #{square || '.'} |" }
      output.puts
      print_separator(board.size, output)
    end
  end

  def print_separator(size, output = $stdout)
    (5 * size).times { output.print '-' }
    output.puts
  end
end
