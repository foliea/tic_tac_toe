require 'game'

module OutputHelper
  extend self

  def clear_screen
    system('clear')
  end

  def print_state(state, output = $stdout)
    [
      [Game::X_SYMBOL_WIN,   "#{Params::X_SYMBOL} wins !"],
      [Game::O_SYMBOL_WIN,   "#{Params::O_SYMBOL} wins !"],
      [Game::DRAW,           "It's a draw !"],
      [Game::FORBIDDEN_MOVE, "Forbidden move !"]
    ].each { |s, msg| output.puts msg if state == s }
  end

  def print_board(board, output = $stdout)
    clear_screen

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
