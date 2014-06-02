require 'spec_helper'
require 'stringio'
require 'output_helper'
require 'board'

describe OutputHelper do
  let(:output) { StringIO.new }
  let(:board)  { Board.new(3) }

  it 'prints state' do
    output.expects(:puts).at_least(1)
    OutputHelper.print_state(Game::X_SYMBOL_WIN, output)
  end

  it 'prints board' do
    output.expects(:puts).at_least(1)
    OutputHelper.stubs(:clear_screen)
    OutputHelper.print_board(board, output)
  end

  it 'prints separator' do
    output.expects(:puts).at_least(1)
    OutputHelper.print_separator(1, output)
  end
end
