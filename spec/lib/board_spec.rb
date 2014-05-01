require 'spec_helper'

describe Board do
  let(:board)              { Board.new }
  let(:x_symbol)           { Parameters::X_SYMBOL }
  let(:o_symbol)           { Parameters::O_SYMBOL }
  let(:blank_symbol)       { Parameters::BLANK_SYMBOL }
  let(:board_total_size)   { Parameters::BOARD_SIZE ** 2 }

  it 'should assign 9 squares' do
    expect(board.grid.size).to eq(board_total_size)
  end

  it "shouldn't allow outside move" do
    expect(board.move_available?(-1)).to be_false
  end

  it "souldn't move on non empty square" do
    board.grid = [ x_symbol ]
    expect(board.move_available?(0)).to be_false
    expect(board.move(0, x_symbol)).to be_nil
  end

  it 'should undo move' do
    board.grid = [ x_symbol ]
    board.undo_move(0)
    expect(board.move_available?(0)).to be_true
  end

  it 'should move on empty square' do
    expect(board.move(0, x_symbol)).to_not be_nil
  end

  it 'should reset' do
    board.reset
    expect(board.empty_squares.size).to eq(board_total_size)
  end

  it 'should decrease empty squares' do
    board.grid = [ x_symbol,     blank_symbol, blank_symbol,
                   blank_symbol, blank_symbol, blank_symbol,
                   blank_symbol, blank_symbol, blank_symbol ]
    expect(board.empty_squares.size).to be < board_total_size
  end

  it 'should detect if board is full with no winner' do
    board.grid = [ x_symbol, o_symbol, x_symbol,
                   x_symbol, o_symbol, x_symbol,
                   o_symbol, x_symbol, o_symbol ]
    expect(board).to be_draw
  end

  it 'should find if it has symbol on location' do
    board.grid = [ x_symbol ]
    expect(board.square_has_symbol?(0, x_symbol)).to be_true
  end

  it 'should detect winning on row' do
    board.grid = [ x_symbol, x_symbol, x_symbol ]
    expect(board.win?(x_symbol)).to be_true
  end

  it 'should detect winning on column' do
    board.grid = [ x_symbol, blank_symbol, blank_symbol,
                   x_symbol, blank_symbol, blank_symbol,
                   x_symbol, blank_symbol, blank_symbol ]
    expect(board.win?(x_symbol)).to be_true
  end

  it 'should detect winning on diagonale' do
    board.grid = [ x_symbol,     blank_symbol, blank_symbol,
                   x_symbol,     x_symbol,     blank_symbol,
                   blank_symbol, blank_symbol, x_symbol ]
    expect(board.win?(x_symbol)).to be_true
  end
end
