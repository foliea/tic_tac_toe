require 'spec_helper'

describe OutputHelper do
  let(:output) { StringIO.new }
  let(:board)  { Board.new(3) }

  it 'should print state' do
    output.expects(:puts)
    OutputHelper.print_state(State::X_SYMBOL_WIN, output)
  end

  it 'should print board' do
    output.expects(:puts).at_least(1)
    OutputHelper.print_board(board, output)
  end

  it 'should print separator' do
    output.expects(:puts).at_least(1)
    OutputHelper.print_separator(1, output)
  end
end
