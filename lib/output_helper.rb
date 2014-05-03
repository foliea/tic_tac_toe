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
    system('clear')

    print_separator(board.size, output)

    board.grid.each_slice(board.size) do |row|
      row.each_with_index do |square, index|
        output.print " #{square || '.'} "
        output.print '|' unless index == board.size - 1
      end
      output.puts

      print_separator(board.size, output)

    end
  end

  def print_separator(size, output = $stdout)
    (3 * size + size - 1).times { output.print '-' }
    output.puts
  end
end
