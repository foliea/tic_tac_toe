module OutputHelper
  extend self

  def print_state(state, output_stream = $stdout)
    output_stream.puts case state
    when State::X_SYMBOL_WIN
      "-- #{Parameters::X_SYMBOL} wins -- "
    when State::O_SYMBOL_WIN
      "-- #{Parameters::O_SYMBOL} wins -- "
    when State::DRAW
      "-- It's a draw -- "
    when State::FORBIDDEN_MOVE
      "-- Forbidden move --"
    end
  end

  def print_board(board, output_stream = $stdout)
    system('clear')
    output_stream.puts '-----'
    board.grid.each_slice(Parameters::BOARD_SIZE) do |slice|
      output_stream.puts slice.to_s
    end
    output_stream.puts '-----'
  end
end
