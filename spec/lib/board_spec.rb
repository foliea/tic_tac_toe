require 'spec_helper'

describe Board do
  let(:board)  { Board.new }
  let(:x_symbol) { Board::X_SYMBOL }
  let(:o_symbol) { Board::O_SYMBOL }
  
  it 'should assign 9 squares' do
    board.to_a.size.should be 9
  end

  it "shouldn't allow outside move" do
    board.move_available?(-1).should be_false
  end

  it "souldn't move on non empty square" do
    board.move(0, x_symbol)
    board.move_available?(0).should be_false
  end

  it 'should move on empty square' do
    board.move(0, x_symbol).should_not be_nil
  end

  it 'should decrease empty squares' do
    count = board.empty_squares.size
    board.move(0, x_symbol)
    board.empty_squares.size.should be < count
  end

  it 'should detect if board is full with no winner' do
    [ x_symbol, o_symbol, x_symbol,
      x_symbol, o_symbol, x_symbol,
      o_symbol, x_symbol, o_symbol].each.with_index do |symbol, index|
      board.move(index, symbol)
    end
    board.should be_draw
  end

  it 'should detect winning' do
    (0..3).each { |location| board.move(location, x_symbol) }
    board.win?(x_symbol).should be_true
  end
end
