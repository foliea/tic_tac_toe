module OutputHelper
  extend self

  def print_state(state, output = $stdout)
    [ 
      [State::X_SYMBOL_WIN, "#{Parameters::X_SYMBOL} wins !"],
      [State::O_SYMBOL_WIN, "#{Parameters::O_SYMBOL} wins !"],
      [State::DRAW, "It's a draw !"],
      [State::FORBIDDEN_MOVE, "Forbidden move !"]
    ].each { |s, msg| output.puts msg if state == s }
  end

  def print_board(board, output = $stdout)
    system('clear')
    print_separator(output)
    board.grid.each_slice(Parameters::BOARD_SIZE) do |row|
      row.each { |square| output.print "| #{square || '.'} |" }
      output.puts
      print_separator(output)
    end
  end
  
  def print_separator(output = $stdout)
    (0..5 * Parameters::BOARD_SIZE - 1).each { output.print '-' }
    output.puts
  end
end
