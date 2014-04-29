require 'spec_helper'

describe Board do
  let(:board)        { Board.new }
  let(:x_symbol)     { Board::X_SYMBOL }
  let(:o_symbol)     { Board::O_SYMBOL }
  let(:blank_symbol) { Board::BLANK_SYMBOL }
  let(:board_size)   { Board::SIZE }

  it 'should assign 9 squares' do
    expect(board.to_a.size).to eq(board_size)
  end

  it "shouldn't allow outside move" do
    expect(board.move_available?(-1)).to be_false
  end

  it "souldn't move on non empty square" do
    board.move(0, x_symbol)
    expect(board.move_available?(0)).to be_false
  end

  it 'sould undo move' do
    board.undo_move(0)
    expect(board.move_available?(0)).to be_true
  end

  it 'should move on empty square' do
    expect(board.move(0, x_symbol)).to_not be_nil
  end

  it 'should reset' do
    board.reset
    expect(board.empty_squares.size).to eq(board_size)
  end

  it 'should decrease empty squares' do
    count = board.empty_squares.size
    board.move(0, x_symbol)
    expect(board.empty_squares.size).to be < count
  end

  it 'should detect if board is full with no winner' do
    [ x_symbol, o_symbol, x_symbol,
      x_symbol, o_symbol, x_symbol,
      o_symbol, x_symbol, o_symbol].each.with_index do |symbol, index|
      board.move(index, symbol)
    end
    expect(board).to be_draw
  end

  it 'should find if it has symbol on location' do
    board.move(0, x_symbol)
    expect(board.square_has_symbol?(0, x_symbol)).to be_true
  end

  it 'should detect winning' do
    (0..3).each { |location| board.move(location, x_symbol) }
    expect(board.win?(x_symbol)).to be_true
  end
end
