require 'spec_helper'

describe Board do
  let(:board)  { Board.new }

  it 'should assign 9 squares' do
    board.to_a.size.should be 9
  end

  it 'shouldn't move outside' do
    board.move_available?(-1).should be_false
  end

  it 'shouldn't move on non empty square' do
    board.move(0, 'X')
    board.move_available?(0).should be_false
  end

  it 'should move on empty square' do
    board.move(0, 'X').should_not be_nil
  end

  it 'should decrease empty squares' do
    count = board.empty_squares.size
    board.move(0, 'X')
    board.empty_squares.size.should be < count
  end

  it 'should detect if board is full with no winner' do
    [ 'X', 'O', 'X',
      'O', 'O', 'X',
      'X', 'X', 'O'].each.with_index do |symbol, index|
      board.move(index, symbol)
    end
    board.should be_draw
  end

  it 'should detect winning in first colum' do
    (0..3).each { |location| board.move(location, 'X') }
    board.win?('X').should be_true
  end
end
